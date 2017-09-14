//
//  Schedule.swift
//  Aidbox
//
//  Created by Evgeniy Kalyada on 13.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class Schedule: DomainResource {
	var identifier : [Identifier] = []
	var active: Bool?
	var servicCategory: CodeableConcept?
	var serviceType : [CodeableConcept] = []
	var speciality: [CodeableConcept] = []
	var actor: Reference?
	var planningHorizon: Period?
	var comment: String?
}
