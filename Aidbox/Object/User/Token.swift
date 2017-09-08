//
//  Token.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 08.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class Token: BaseObject {
	var accessToken: String = ""
	var refreshToken: String = ""
	var expireAt: Date = Date()

	override func updateFrom(dict: [AnyHashable : Any]) {
		if let accessToken = dict["access_token"] as? String {
			self.accessToken = accessToken
		}
		if let refreshToken = dict["refresh_token"] as? String {
			self.refreshToken = refreshToken
		}
//		if let accessToken = dict["access_token"] as? String {
//			self.accessToken = accessToken
//		}
	}


	
}