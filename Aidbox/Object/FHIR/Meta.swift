//
//  Meta.swift
//  Aidbox
//
//  Created by Evgeniy Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class Meta: BaseObject {

	var versionId: String?
	var lastUpdated: Date?
	var profile: [URL] = []
	var security: [Coding] = []
	var tag	: [Coding] = []
}
