//
//  Quantity.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class Quantity: BaseObject {
	enum QuantityComparator: String {
		case less = "<"
		case lessEqual = "<="
		case greatEqual = ">="
		case great = ">"
	}

	var value: UInt?
	var comparator : QuantityComparator = .less
	var unit : String?
	var system : String?
	var code: String? 
}
