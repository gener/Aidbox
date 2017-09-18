//
//  BaseObject.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 08.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit
import DateParser
import EVReflection

protocol BaseObjectProtocol {
	
//	var string: String? { get }
//	init(from dict:[AnyHashable : Any])
//	func updateFrom(dict:[AnyHashable : Any])
//	func toDict()->[AnyHashable : Any]
}


open class BaseObject : EVObject {
	
//	fileprivate var _mProperties: [AnyHashable : Any.Type] {
//		get {
//			let mirror = Mirror(reflecting: self)
//			var res : [String:Any.Type] = [:]
//			
//			for (_, attr) in mirror.children.enumerated(){
//				if let property_name = attr.label {
//					let anyMirror = Mirror(reflecting: attr.value)
//					res[property_name] = anyMirror.subjectType
//				}
//			}
//			return res
//	
//		}
//	}

//	required public init(from dict: [AnyHashable : Any]) {
//		super.init()
//		updateFrom(dict: dict)
//	}
	
//	fileprivate func parse<T>(field: String, dict:[AnyHashable : Any]) -> T? {
//		if let value = dict[field] {
//			if value is T {
//				return value as? T
//			}
//		}
//		return nil
//	}

//	func updateFrom(dict: [AnyHashable : Any]) {
////		self.value(forKey: <#T##String#>)
////		listPropertiesWithValues()
//		for row in _mProperties.enumerated() {
//			if let value = parse<row.element.value>(field: row.element.key, dict: dict) {
//				self.setValue(value, forKey: row.element.key)
//			}
////			if let value = dict[row.element.key] {
//////				let test = BaseObject.self
//////				if value is row.element.value {
//////					print("\(row.element.key) set value \(value) of \(row.element.value)")
//////				}
////			}
//		}
//
//	}
	
	

//	func listPropertiesWithValues(reflect: Mirror? = nil) {
//		print("##########")
//		print("res \(self.listProperties)")
//		print("##########")
////		let mirror = reflect ?? Mirror(reflecting: self)
////		if mirror.superclassMirror != nil {
////			self.listPropertiesWithValues(reflect: mirror.superclassMirror)
////		}
//////		type(of: v)
////		var res : [String:Any.Type] = [:]
////
////		for (index, attr) in mirror.children.enumerated(){
////			if let property_name = attr.label {
//////				type
////				let anyMirror = Mirror(reflecting: attr.value)
////				res[property_name] = anyMirror.subjectType
////				//You can represent the results however you want here!!!
//////				print("\(mirror.description) \(index): \(property_name) = \(attr.value) \(type(of:attr.value))")
////			}
////		}
////		print("res \(res)")
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
