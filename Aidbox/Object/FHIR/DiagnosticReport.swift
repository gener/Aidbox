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
	var status: DiagnosticReportStatus = .registered
	var category: CodeableConcept?
	var code : CodeableConcept?
	var subject: Patient?
	var effectiveDateTime: Date?
	var effectivePeriod: Period?
	var issued: Date?
	var performer: Organization?
	var resultsInterpreter: Organization?
	var codedDiagnosis : [CodeableConcept] = []
	var presentedForm : [Attachment] = []
	
}
