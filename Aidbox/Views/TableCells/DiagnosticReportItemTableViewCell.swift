//
//  DiagnosticReportItemTableViewCell.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 20.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit
import EDDateHelper

class DiagnosticReportItemTableViewCell: UITableViewCell {

	@IBOutlet weak var statusLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var practitionerLabel: UILabel!
	@IBOutlet weak var infoLabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	var diagnosticReport: DiagnosticReport? {
		didSet {
			if let item = diagnosticReport, statusLabel != nil {
				statusLabel.text = item.status.rawValue
				if let date = item.issued {
					print("wtf \(date)")
					dateLabel.text = EDDateHelper.stringFrom(date: date, format: .USDate)
				}
				else {
					dateLabel.text = nil
				}
				infoLabel.text = item.conclusion
				if let performer = item.performer.first {
					practitionerLabel.text = performer.display
				}
				else {
					practitionerLabel.text = nil
				}


			}
		}
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
