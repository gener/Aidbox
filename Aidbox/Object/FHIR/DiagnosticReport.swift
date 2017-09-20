//
//  DiagnosticReport.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class DiagnosticReport: BaseObject {

	enum DiagnosticReportStatus: String {
		case registered = "registered"
		case partial = "partial"
		case preliminary = "preliminary"
		case final = "final"
	}

	var identifier : [Identifier] = []
	var basedOn: Reference?
	var status: DiagnosticReportStatus = .registered
	var category: CodeableConcept?
	var code : CodeableConcept?
	var subject: Reference?
	var encounter: Reference?
	var effectiveDateTime: Date?
	var effectivePeriod: Period?
	var issued: Date?
	var performer: Reference?
	var request: [Reference] = []
	var specimen: [Reference] = []
	var result: [Reference] = []
	var imagingStudy: [Reference] = []
	var image: [MediaReference] = []
	var conclusion: String?
	var codedDiagnosis : [CodeableConcept] = []
	var presentedForm : [Attachment] = []
	
}
