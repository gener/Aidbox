//
//  Patient.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 11.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class Patient: BaseObject {

	enum Gender : String {
		case male = "male"
		case female = "female"
		case other = "other"
		case unknown = "unknown"
	}

	var name: [HumanName] = []
	var patientId: String = ""
	var gender: Gender = .unknown
	var birthDate: Date?
	var active: Bool = false
	var address: [Address] = []
	var telecom: [ContactPoint] = []
	var maritalStatus: CodeableConcept?
	var photo: [Attachment] = []

	override func updateFrom(dict: [AnyHashable : Any]) {
		name = []
		if let names = dict["name"] as? [[AnyHashable : Any]] {
			for nameDict in names {
				name.append(HumanName(from: nameDict))
			}
		}

		if let id = dict["id"] as? String {
			self.patientId = id
		}

		if let rawGender = dict["gender"] as? String, let gender = Gender(rawValue: rawGender) {
			self.gender = gender
		}

		if let rawDate = dict["birthDate"] as? String {
			do {
				birthDate = try Date(dateString: rawDate)
			}
			catch {}
		}

		if let active = dict["active"] as? Bool {
			self.active = active
		}

		address = []
		if let addresses = dict["address"] as? [[AnyHashable : Any]] {
			for dict in addresses {
				address.append(Address(from: dict))
			}
		}

		telecom = []
		if let telecoms = dict["telecom"] as? [[AnyHashable : Any]] {
			for dict in telecoms {
				telecom.append(ContactPoint(from: dict))
			}
		}

		if let dict = dict["maritalStatus"] as? [AnyHashable : Any] {
			maritalStatus = CodeableConcept(from: dict)
		}
		photo = []
		if let photos = dict["photo"] as? [[AnyHashable : Any]] {
			for dict in photos {
				photo.append(Attachment(from: dict))
			}
		}

	}

	var displayName: String {
		get {
			if let humanName = name.filter({ (item) -> Bool in
				return item.use == .official
			}).first {
				return humanName.display
			}
			else if let humanName = name.first {
				return humanName.display
			}
			return "N/A"
		}
	}

}
