//
//  MedicationDispense.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class MedicationDispense: BaseObject {

	enum MedicationDispenseStatus : String {
		case preparation = "preparation"
		case inProgress = "in-progress"
		case onHold = "on-hold"
		case completed = "completed"
		case enteredInerror = "entered-in-error"
		case stopped = "stopped"
	}

	var status: MedicationDispenseStatus = .preparation
	var category: CodeableConcept?
	var medication : CodeableConcept?
	var subject : Patient?
//	var performer: []
	var type: CodeableConcept?
	var quantity: Quantity?
	var daySupply: Quantity?
	var whenPrepared : Date?
	var whenHandedOver : Date?
	var note : [Annotation] = []
	var dosageInstruction : [Dosage] = []
	var notDone: Bool?

}
