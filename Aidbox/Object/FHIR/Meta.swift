//
//  Meta.swift
//  Aidbox
//
//  Created by Evgeniy Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit
import EDDateHelper

class Meta: BaseObject {

	var versionId: String?
	var lastUpdated: Date?
	var profile: [URL] = []
	var security: [Coding] = []
	var tag	: [Coding] = []
	var extensions: [Extension] = []

	override public func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
		return [(keyInObject: "extensions", keyInResource: "extension")]
	}

	override func propertyConverters() -> [(key: String, decodeConverter: ((Any?) -> ()), encodeConverter: (() -> Any?))] {
		return [(
					key: "lastUpdated",
					decodeConverter: {
						if let val = $0 as? String {
							self.lastUpdated = EDDateHelper.dateFrom(string: val, format: .ISODateTime)
						}
				},
					encodeConverter: {
						if let date = self.lastUpdated {
							return EDDateHelper.stringFrom(date: date, format: .ISODateTime)
						}
						return nil
				})
		]
	}
}
