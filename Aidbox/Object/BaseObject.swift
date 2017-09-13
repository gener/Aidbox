//
//  BaseObject.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 08.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit
import DateParser

protocol BaseObjectProtocol {
	
	var string: String? { get }
	init(from dict:[AnyHashable : Any])
	func updateFrom(dict:[AnyHashable : Any])
	func toDict()->[AnyHashable : Any]
}


open class BaseObject : BaseObjectProtocol {

	required public init(from dict: [AnyHashable : Any]) {
		updateFrom(dict: dict)
	}

	func updateFrom(dict: [AnyHashable : Any]) {

	}

	func toDict() -> [AnyHashable : Any] {
		return [:]
	}
	
	var string: String? {
		get {
			return nil
		}
	}
	


}
