//
//  Group.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 11.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class Group: BaseObject {
	var groupId: Int = 0
	var name: String = ""
	var desc: String = ""
	var createdAt: Date = Date()

	override func updateFrom(dict: [AnyHashable : Any]) {
		if let groupId = dict["id"] as? Int {
			self.groupId = groupId
		}

		if let name = dict["name"] as? String {
			self.name = name
		}

		if let desc = dict["description"] as? String {
			self.desc = desc
		}

		if let rawDate = dict["created_at"] as? String {
			do {
				createdAt = try Date(dateString: rawDate)
			}
			catch {}
		}
	}

}
