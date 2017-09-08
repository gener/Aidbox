//
//  UserManager.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 07.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit
import Alamofire

class UserManager {

	private static var _instance : UserManager?

	private let clientId = "site"
	private let clientSecret = "doesnotmatter"
	private let clientAuthorizeURI = "https://waveacc.aidbox.io/oauth/authorize"
	private let clientTokenURI = "https://waveacc.aidbox.io/oauth/token"
	private let clientRedirectURI = "https://waveacc.aidbox.io"
	private let clientScope = "all"
	private let clientGrantType = "authorization_code"


	var user = User(from: [:])
	var token = Token(from: [:])

	var isLoggedIn : Bool {
		get {
			return user.userId > 0
		}
	}

	static var instance : UserManager {
		get {
			if let instance = UserManager._instance {
				return instance
			}
			let instance = UserManager()
			UserManager._instance = instance
			return instance
		}
	}

	func login(email: String, password: String, result:@escaping ((Error?, User?) -> Void)) {


		WebService.instance.manager.delegate.taskWillPerformHTTPRedirection = {[unowned self] session, task, response, request in
			if let code = request.url?.queryItems["code"] {
				WebService.instance.manager.delegate.taskWillPerformHTTPRedirection = nil
				self.requestAuthToken(code: code, result: result)
				return nil
			}

			return request
		}

		let params = [
			"client_id": clientId,
			"redirect_uri": clientRedirectURI,
			"scope": clientScope,
			"user[email]":email,
			"user[password]" : password
		]
		WebService.instance.manager.request(Endpoint.oauthCode, method: .post, parameters: params).response { (response) in
			if let error = response.error {
				result(error, nil)
			}
		}
	}

	private func requestAuthToken(code: String, result:@escaping ((Error?, User?) -> Void)) {
		let params = [
			"client_id": clientId,
			"redirect_uri": clientRedirectURI,
			"client_secret": clientSecret,
			"code":code,
			"grant_type" : clientGrantType
		]
		WebService.instance.manager.request(Endpoint.oauthToken, method:.post, parameters:params).responseJSON(completionHandler: {[unowned self] (response) in
			if let error = response.error {
				result(error, nil)
			}
			if let dict = response.result.value as? [AnyHashable : Any] {
				self.token = Token(from: dict)
				WebService.instance.setToken(accessToken: self.token.accessToken)
				self.requestUserInfo(result: result)
			}
			else {
				let err = NSError(domain: "accessToken", code: -1, userInfo: [:])
				result(err, nil)
			}
		})
	}


	private func requestUserInfo(result:@escaping ((Error?, User?) -> Void)) {
		WebService.instance.manager.request(Endpoint.curretnUser, method:.get).responseJSON(completionHandler: {[unowned self] (response) in
			if let error = response.error {
				result(error, nil)
			}
			if let dict = response.result.value as? [AnyHashable : Any] {
				self.user = User(from: dict)
				result(response.error, self.user)
			}
			else {
				let err = NSError(domain: "user", code: -1, userInfo: [:])
				result(err, nil)
			}
		})
	}

}
