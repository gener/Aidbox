//
//  MedicationRequest.swift
//  Aidbox
//
//  Created by Evgeniy Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class MedicationRequest: DomainResource {
	
	enum MedicationRequestStatus : String {
		case active = "active"
		case onHold = "on-hold"
		case cancelled = "cancelled"
		case completed = "completed"
		case enteredInError = " entered-in-error"
		case stopped = "stopped"
		case draft = "draft"
		case unknown = "unknown"
	}
	
	enum MedicationRequestIntent : String {
		case proposal = "proposal"
		case plan = "plan"
		case order = "order"
		case instanceOrder = "instance-order"
	}
	
	enum MedicationRequestPriority: String {
		case routine = "routine"
		case urgent = "urgent"
		case stat = "stat"
		case asap = "asap"
	}

	var identifier: [Identifier] = []
	var definition: [Reference] = []
	var basedOn: [Reference] = []
	var groupIdentifier : Identifier?
	var status:MedicationRequestStatus = .unknown
	var intent:MedicationRequestIntent = .proposal
	var category: CodeableConcept?
	var priority: MedicationRequestPriority = .routine
	var medicationCodeableConcept: CodeableConcept?
	var medicationReference: Reference?
	var subject: Reference?
	var context: Reference?
	var supportingInformation:[Reference] = []
	var authoredOn: Date?
	var requester : MedicationRequester?
	var recorder: Reference?
	var performer: Reference?
	var reasonCode: [CodeableConcept] = []
	var reasonReference: [Reference] = []
	var note : [Annotation] = []
	var dosageInstruction: [Dosage] = []
	
}
