//
//  Media.swift
//  Aidbox
//
//  Created by Evgeniy Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class Media: DomainResource {
	enum DigitalMediaType: String {
		case photo = "photo"
		case video = "video"
		case audio = "audio"
	}

	var identifier : [Identifier] = []
	var basedOn: [Reference] = []
	var type: DigitalMediaType = .photo
	var supType: CodeableConcept?
	var view: CodeableConcept?
	var subject: Reference?
	var context: Reference?
	var occurrenceDateTime: Date?
	var occurrencePeriod: Period?
	var foperator: Reference?
	var reasonCode: CodeableConcept?
	var bodySite: CodeableConcept?
	var device: Reference?
	var height: UInt?
	var width: UInt?
	var frames: UInt?
	var duration: UInt?
	var content: Attachment?
	var note : [Annotation] = []
	

}
