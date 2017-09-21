//
//  Narrative.swift
//  Aidbox
//
//  Created by Evgeniy Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class Narrative: Element {
	
	enum NarrativeStatus : String {
		case generated = "generated"
		case extensions = "extensions"
		case additional = "additional"
		case empty = "empty"
	}
	
	var status: NarrativeStatus = .empty
	var div : String?

	override func propertyConverters() -> [(key: String, decodeConverter: ((Any?) -> ()), encodeConverter: (() -> Any?))] {
		return [
			( // We want a custom converter for the field partientId
				key: "status",
				decodeConverter: {
					if let val = $0 as? String, let status = NarrativeStatus(rawValue:val) {
						self.status = status
					}
			},
				encodeConverter: {
					return self.status.rawValue
			})
		]
	}
}
