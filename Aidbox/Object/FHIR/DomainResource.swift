//
//  DomainResource.swift
//  Aidbox
//
//  Created by Evgeniy Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class DomainResource: Resource {
	var name: String?
	var text: Narrative?
	var contained: [Resource] = []
	var ext: [AnyHashable: Any]?
	var modifierExtension: [AnyHashable: Any]?
	var resourceType: String?
	
}
