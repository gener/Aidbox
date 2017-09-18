//
//  User.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 07.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class User : BaseObject {

	var userId: Int = 0
	var email: String = ""
	var patientId: String = ""
	var groups : [Group] = []
	var patient: Patient = Patient()
	
	override public func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
		return [(keyInObject: "patientId", keyInResource: "data"), (keyInObject: "userId", keyInResource: "id")]
	}
	
	override func propertyConverters() -> [(key: String, decodeConverter: ((Any?) -> ()), encodeConverter: (() -> Any?))] {
		return [
			( // We want a custom converter for the field partientId
				key: "patientId"
				, decodeConverter: {
					if let dict = $0 as? [AnyHashable : Any], let patientId = dict["patient_id"] as? String {
						self.patientId = patientId
					}
				}
				, encodeConverter: { return self.patientId})
		]
	}

	
//	override func updateFrom(dict: [AnyHashable : Any]) {
//
//		if let id = dict["id"] as? Int {
//			userId = id
//		}
//
//		if let email = dict["email"] as? String {
//			self.email = email
//		}
//
//		if let data = dict["data"] as? [AnyHashable : Any], let patientId = data["patient_id"] as? String {
//			self.patientId = patientId
//		}
//		if let items = dict["groups"] as? [[AnyHashable : Any]] {
//			for row in items {
//				let tmp = Group(from: row)
//				groups.append(tmp)
//			}
//		}
//	}
	

}
