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

	override func updateFrom(dict: [AnyHashable : Any]) {
		if let id = dict["id"] as? Int {
			userId = id
		}
		if let email = dict["email"] as? String {
			self.email = email
		}
		if let data = dict["data"] as? [AnyHashable : Any], let patientId = data["patient_id"] as? String {
			self.patientId = patientId
		}
	}
	

}
