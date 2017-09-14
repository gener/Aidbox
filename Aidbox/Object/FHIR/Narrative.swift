//
//  Narrative.swift
//  Aidbox
//
//  Created by Evgeniy Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class Narrative: Element {
	
	enum NarrativeStatus : String {
		case generated = "generated"
		case extensions = "extensions"
		case additional = "additional"
		case empty = "empty"
	}
	
	var status: NarrativeStatus = .empty
	var div : String? 
}
