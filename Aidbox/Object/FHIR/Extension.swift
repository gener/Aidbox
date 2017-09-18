//
//  Extension.swift
//  Aidbox
//
//  Created by Evgeniy Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class Extension: Element {

	var url: String?
	var valueInteger: Int?
	var valueDecimal: UInt?
	var valueDateTime: Date?
	var valueDate: Date?
	var valueInstant: Date?
	var valueString: String?
	var valueUri : String?
	var valueBoolean: Bool?
	var valueCode: String?
	var valueBase64Binary : Data?
	var valueCoding: Coding?
	var valueCodeableConcept: CodeableConcept?
	var valueAttachment: Attachment?
	var valueIdentifier: Identifier?
	var valueQuantity: Quantity?
	var valueRange: FRange?
	var valuePeriod: Period?
	var valueRatio: Ratio?
	var valueHumanName: HumanName?
	var valueAddress: Address?
	var valueContactPoint: ContactPoint?
	var valueSchedule : Schedule?
	var valueReference: Reference?
	
}
