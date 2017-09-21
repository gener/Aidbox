//
//  Token.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 08.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit
import EDDateHelper

class Token: BaseObject {
	var accessToken: String = ""
	var refreshToken: String = ""
	var expiresAt: Date = Date()

	override func propertyConverters() -> [(key: String, decodeConverter: ((Any?) -> ()), encodeConverter: (() -> Any?))] {
		return [(
					key: "expiresAt",
					decodeConverter: {
						if let val = $0 as? String {
							self.expiresAt = EDDateHelper.dateFrom(string: val, format: .ISODateTime)!
						}
				},
					encodeConverter: {
						return EDDateHelper.stringFrom(date: self.expiresAt, format: .ISODateTime)
				})
		]
	}
	
}
