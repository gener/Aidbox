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

	var use: AddressUse = .temp
	var type: AddressType = .postal
	var text: String?
	var line: [String] = []
	var city: String?
	var district: String?
	var state: String?
	var postalCode: String?
	var country: String?
	var period: Period?
	
	override var string: String? {
		get {
			var tmp = ""
			var address = [postalCode, text]
			for line in self.line {
				address.append(line)
			}
			address.append(city)
			address.append(state)
			address.append(country)
			for item in address {
				if let item = item {
					if tmp.characters.count > 0 {
						tmp = "\(tmp), "
					}
					tmp = tmp + item
				}
			}
			return "\(use.rawValue) \(type.rawValue): \(tmp)"
		}
	}

//	required init(from dict: [AnyHashable : Any]) {
//		self.use = .temp
//		if let rawUse = dict["use"] as? String, let use = AddressUse(rawValue: rawUse) {
//			self.use = use
//		}
//
//		self.type = .postal
//		if let rawType = dict["type"] as? String, let type = AddressType(rawValue: rawType) {
//			self.type = type
//		}
//
//		if let text = dict["text"] as? String {
//			self.text = text
//		}
//
//		if let lines = dict["line"] as? [String] {
//			for line in lines  {
//				self.line.append(line)
//			}
//		}
//
//		if let city = dict["city"] as? String {
//			self.city = city
//		}
//
//		if let district = dict["district"] as? String {
//			self.district = district
//		}
//
//		if let state = dict["state"] as? String {
//			self.state = state
//		}
//
//		if let postalCode = dict["postalCode"] as? String {
//			self.postalCode = postalCode
//		}
//
//		if let country = dict["country"] as? String {
//			self.country = country
//		}
//
//		if let periodDict = dict["period"] as? [AnyHashable : Any] {
//			self.period = Period(from: periodDict)
//		}
//
//		super.init(from: dict)
//	}
}
