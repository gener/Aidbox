//
//  WebService.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 08.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit
import Alamofire

class WebService {

	private static var _instance : WebService?

	static var instance : WebService {
		get {
			if let instance = WebService._instance {
				return instance
			}
			let instance = WebService()
			WebService._instance = instance
			return instance
		}
	}

	var manager = Alamofire.SessionManager()

	func setToken(accessToken : String?) {
		var defaultHeaders = Alamofire.SessionManager.defaultHTTPHeaders
		if accessToken != nil {
			defaultHeaders["Authorization"] = "Bearer \(accessToken!)"
		}
		else {
			defaultHeaders.removeValue(forKey: "Authorization")
		}


		let configuration = URLSessionConfiguration.default
		configuration.httpAdditionalHeaders = defaultHeaders

		manager = Alamofire.SessionManager(configuration: configuration)
	}


}
