//
//  Organization.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class Organization: BaseObject {

	var identifier : Identifier?
	var active: Bool?
	var type: CodeableConcept?
	var name: String?
	var alias: String?
	var address: Address?
	var partOf: Organization?


}
