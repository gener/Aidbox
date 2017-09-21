//
//  Identifier.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class Identifier: BaseObject {

	enum IdentifierUse : String {
		case usual = "usual"
		case official = "official"
		case temp = "temp"
		case secondary = "secondary"
	}

	var use : IdentifierUse = .temp
	var type: CodeableConcept?
	var system: String?
	var value: String?
	var period: Period?
	var assigner : Organization?

	override func propertyConverters() -> [(key: String, decodeConverter: ((Any?) -> ()), encodeConverter: (() -> Any?))] {
		return [
			( // We want a custom converter for the field partientId
				key: "use",
				decodeConverter: {
					if let val = $0 as? String, let use = IdentifierUse(rawValue:val) {
						self.use = use
					}
			},
				encodeConverter: {
					return self.use.rawValue

			})
		]
	}

}
