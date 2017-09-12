//
//  HumanName.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 11.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class HumanName: BaseObject {

	enum NameUse : String {
		case usual = "usual"
		case official = "official"
		case temp = "temp"
		case nickname = "nickname"
		case anonymous = "anonymous"
		case old = "old"
		case maiden = "maiden"
	}

	var use: NameUse
	var text : String?
	var family : [String] = []
	var given : [String] = []
	var prefix : String?
	var suffix : String?
	var period : Period?

	var display : String {
		get {
			var family = ""
			var name = ""
			if let lastFamily = self.family.last {
				family = lastFamily
			}
			if let text = self.text {
				name = text
			}
			return "\(name) \(family)"
		}
	}

	required init(from dict: [AnyHashable : Any]) {
		self.use = .temp
		if let rawUse = dict["use"] as? String, let use = NameUse(rawValue: rawUse) {
			self.use = use
		}

		if let text = dict["text"] as? String {
			self.text = text
		}

		if let family = dict["family"] as? [String] {
			self.family = family
		}

		if let given = dict["given"] as? [String] {
			self.given = given
		}

		if let prefix = dict["prefix"] as? String {
			self.prefix = prefix
		}

		if let suffix = dict["suffix"] as? String {
			self.suffix = suffix
		}

		if let periodDict = dict["period"] as? [AnyHashable : Any] {
			self.period = Period(from: periodDict)
		}
		super.init(from: dict)
	}


}
