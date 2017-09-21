//
//  DiagnosticReport.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.asd
//

import UIKit
import EDDateHelper

class DiagnosticReport: DomainResource {

	enum DiagnosticReportStatus: String {
		case registered = "registered"
		case partial = "partial"
		case preliminary = "preliminary"
		case final = "final"
	}

	var conclusion: String?
	var identifier : [Identifier] = []
	var basedOn: Reference?
	var status: DiagnosticReportStatus = .registered
	var diagnosticReportId : String = ""
	var category: CodeableConcept?
	var code : CodeableConcept?
	var subject: Reference?
	var encounter: Reference?
	var effectiveDateTime: Date?
	var effectivePeriod: Period?
	var issued: Date?
	var performer: [Reference] = []
	var request: [Reference] = []
	var specimen: [Reference] = []
	var result: [Reference] = []
	var imagingStudy: [Reference] = []
	var image: [MediaReference] = []
	var codedDiagnosis : [CodeableConcept] = []
	var presentedForm : [Attachment] = []

	override public func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
		return [(keyInObject: "diagnosticReportId", keyInResource: "id")]
	}

	override func propertyConverters() -> [(key: String, decodeConverter: ((Any?) -> ()), encodeConverter: (() -> Any?))] {
		return [(
				key: "status",
				decodeConverter: {
					if let val = $0 as? String, let status = DiagnosticReportStatus(rawValue:val) {
						self.status = status
					}
				},
				encodeConverter: {
					return self.status.rawValue
				}),
				(
				key: "effectiveDateTime",
				decodeConverter: {
					if let val = $0 as? String {
						self.effectiveDateTime = EDDateHelper.dateFrom(string: val, format: .ISODateTime)
					}
				},
				encodeConverter: {
					if let date = self.effectiveDateTime {
						return EDDateHelper.stringFrom(date: date, format: .ISODateTime)
					}
					return nil
				}),
				(
					key: "issued",
					decodeConverter: {
						if let val = $0 as? String {
							self.issued = EDDateHelper.dateFrom(string: val, format: .ISODate)
						}
				},
					encodeConverter: {
						if let date = self.issued {
							return EDDateHelper.stringFrom(date: date, format: .ISODate)
						}
						return nil
				})
		]
	}

}
