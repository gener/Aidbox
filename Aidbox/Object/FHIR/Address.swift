//
//  Address.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 11.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class Address: BaseObject {

	enum AddressUse : String {
		case home = "home"
		case work = "work"
		case temp = "temp"
		case old = "old"
	}

	enum AddressType : String {
		case postal = "postal"
		case physical = "physical"
		case both = "both"
	}

	var use: AddressUse
	var type: AddressType
	var city: String?
	var line: [String] = []
	var period: Period?
	var country: String?
	var postalCode: String?
	var district: String?
}
