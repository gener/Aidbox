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

	var patientId: String = ""
	var gender: Gender = .unknown
	var birthDate: Date?
	var active: Bool = false
	
}
