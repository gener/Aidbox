//
//  ContactPoint.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 11.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class ContactPoint: BaseObject {

	enum ContactPointSystem : String {
		case phone = "phone"
		case fax = "fax"
		case email = "email"
		case pager = "pager"
		case url = "url"
		case sms = "sms"
		case other = "other"
	}

	enum ContactPointUse : String {
		case home = "home"
		case work = "work"
		case temp = "temp"
		case old = "old"
		case mobile = "mobile"
	}

	var system : ContactPointSystem
	var value: String?
	var use: ContactPointUse
	var rank : UInt?
	var period : Period?
	
	override var string: String? {
		get {
			if let value = value {
				return "\(system.rawValue) \(value)"
			}
			return nil
			
		}
	}
	

	required init(from dict: [AnyHashable : Any]) {
		self.system  = .other
		if let rawSystem = dict["system"] as? String, let system = ContactPointSystem(rawValue: rawSystem) {
			self.system = system
		}
		if let value = dict["value"] as? String {
			self.value = value
		}

		use = .temp
		if let rawUse = dict["use"] as? String, let use = ContactPointUse(rawValue: rawUse) {
			self.use = use
		}
		if let rank = dict["rank"] as? UInt {
			self.rank = rank
		}
		if let periodDict = dict["period"] as? [AnyHashable : Any] {
			self.period = Period(from: periodDict)
		}

		super.init(from: dict)
	}
}
