//
//  Attachment.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 12.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class Attachment: BaseObject {

	var contentType: String?
	var language: String?
	var data: Data?
	var url: URL?
	var size: UInt?
	var hash: Data?
	var title: String?
	var creation: Date?

	override func updateFrom(dict: [AnyHashable : Any]) {

		if let contentType = dict["contentType"] as? String {
			self.contentType = contentType
		}
		if let language = dict["language"] as? String {
			self.language = language
		}
		if let data = dict["data"] as? String {
			self.data = data.data(using: .unicode)
		}
		if let url = dict["url"] as? String {
			self.url = URL(string: url)
		}
		if let size = dict["size"] as? UInt {
			self.size = size
		}
		if let hash = dict["hash"] as? String {
			self.hash = hash.data(using: .unicode)
		}
		if let title = dict["title"] as? String {
			self.language = title
		}

		if let rawDate = dict["creation"] as? String {
			do {
				creation = try Date(dateString: rawDate)
			}
			catch {}
		}
	}

}
