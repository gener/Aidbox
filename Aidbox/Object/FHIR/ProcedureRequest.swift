//
//  ProcedureRequest.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 21.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class ProcedureRequest: DomainResource {

	enum ProcedureRequestStatus: String {
		case proposed = "proposed"
		case draft = "draft"
		case requested = "requested"
		case received = "received"
		case accepted = "accepted"
		case inProgress = "in-progress"
		case completed = "completed"
		case suspended = "suspended"
		case rejected = "rejected"
		case aborted = "aborted"
	}

	enum ProcedureRequestPriority: String {
		case routine = "routine"
		case urgent = "urgent"
		case stat = "stat"
		case asap = "asap"
	}

	var identifier: [Identifier] = []
	var subject: Reference?
	var code: CodeableConcept?
	var bodyStyle: [CodeableConcept] = []
	var reasonCodeableConcept : CodeableConcept?
	var reasonReference: Reference?
	var scheduledDateTime: Date?
	var scheduledPeriod: Period?
	var scheduledTiming: Timing?
	var encounter: Reference?
	var performer: Reference?
	var status: ProcedureRequestStatus = .draft
	var notes: [Annotation] = []
	var asNeededBoolean: Bool?
	var asNeededCodeableConcept: CodeableConcept?
	var orderedOn: Date?
	var orderer: Reference?
	var priority: ProcedureRequestPriority = .routine
}
