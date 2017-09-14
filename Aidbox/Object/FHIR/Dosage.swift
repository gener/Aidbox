//
//  Dosage.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class Dosage: Element {

	var sequence: Int?
	var text: String?
	var additionalInstruction: [CodeableConcept] = []
	var patientInstruction: String?
	var timing: Timing?
	var asNeededBoolean: Bool?
	var asNeededCodeableConcept: CodeableConcept?
	var site: CodeableConcept?
	var route: CodeableConcept?
	var method: CodeableConcept?
	var dosageRange: FRange?
	var dosageQuantity: Quantity?
	var maxDosePerPeriod: Ratio?
	var maxDosePerAdministration: Quantity?
	var maxDosePerLifetime: Quantity?
	var rateRatio: Ratio?
	var rateRange: FRange?
	var rateQuantity: Quantity?

}
