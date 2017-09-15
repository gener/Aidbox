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
//		listPropertiesWithValues()

	}

//	func listPropertiesWithValues(reflect: Mirror? = nil) {
//		let mirror = reflect ?? Mirror(reflecting: self)
//		if mirror.superclassMirror != nil {
//			self.listPropertiesWithValues(reflect: mirror.superclassMirror)
//		}
////		var res : [String:type] = [:]
//
//		for (index, attr) in mirror.children.enumerated(){
//			if let property_name = attr.label {
////				type
//				res[property_name] = type(of:attr.value)
//				//You can represent the results however you want here!!!
////				print("\(mirror.description) \(index): \(property_name) = \(attr.value) \(type(of:attr.value))")
//			}
//		}
//	}

	func toDict() -> [AnyHashable : Any] {
		return [:]
	}

	var string: String? {
		get {
			return nil
		}
	}
	


}
