//
//  Dosage.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class Dosage: BaseObject {

	var sequence: Int?
	var text: String?
	var additionalInstruction: CodeableConcept?
	var patientInstruction: String?
//	var timing: Tinimg? 
	var site: CodeableConcept?
	var route: CodeableConcept?
	var method: CodeableConcept?
	var maxDosePerPeriod: Ratio?
	var maxDosePerAdministration: Quantity?
	var maxDosePerLifetime: Quantity?

}
