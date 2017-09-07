//
//  UserManager.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 07.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit


class UserManager {

	private static var _instance : UserManager?

	let clientId = "site"
	let clientSecret = "doesnotmatter"
	let clientAuthorizeURI = "https://waveacc.aidbox.io/oauth/authorize"
	let clientTokenURI = "https://waveacc.aidbox.io/oauth/token"
	let clientRedirectURI = "https://waveacc.aidbox.io"
	let clientScope = "all"

	var user = User()

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

}
