//
//  DiagnosticReportViewController.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 20.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit
import EDControllers
import EDDateHelper

enum SectionTypes : String {
	case info = "Info"
	case performes = "Performers"
	case requests = "Requests"
	case images = "Images"
	case results = "Results"
	case attachments = "Attachments"
}

class DiagnosticReportViewController: EDTableViewController {

	var item : DiagnosticReport = DiagnosticReport() {
		didSet {
			sections = []
			sections.append(.info)

			let tmp : [([Any], SectionTypes)] = [
				(item.performer, SectionTypes.performes),
				(item.request, SectionTypes.requests),
				(item.image, SectionTypes.images),
				(item.result, SectionTypes.results),
				(item.presentedForm, SectionTypes.attachments)
			]
			for row in tmp {
				if row.0.count > 0 {
					sections.append(row.1)
				}
			}

			if tableView != nil {
				tableView.reloadData()
			}
		}
	}
	var sections : [SectionTypes] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.tableFooterView = UIView()
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 100

		title = item.conclusion
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return sections.count
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let sectionType = sections[section]

		switch sectionType {
		case .info:
			return 3
		case .performes:
			return item.performer.count
		case .requests:
			return item.request.count
		case .results:
			return item.result.count
		case .attachments:
			return item.presentedForm.count
		case .images:
			return item.image.count
		}
	}

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return sections[section].rawValue
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch sections[indexPath.section] {
		case .info:
			switch indexPath.row {
			case 0:
				let cell = tableView.dequeueReusableCell(withIdentifier: "keyValueCell", for: indexPath)
				cell.textLabel?.text = "Status"
				cell.detailTextLabel?.text = item.status.rawValue
				return cell
			case 1:
				let cell = tableView.dequeueReusableCell(withIdentifier: "keyValueCell", for: indexPath)
				cell.textLabel?.text = "Issued"
				if let date = item.issued {
					cell.detailTextLabel?.text = EDDateHelper.stringFrom(date: date, format: .USDateShort)
				}
				else {
					cell.detailTextLabel?.text = "-"
				}
				return cell
			default:
				let cell = tableView.dequeueReusableCell(withIdentifier: "keyValue2Cell", for: indexPath)
				cell.textLabel?.text = "Conclusion"
				cell.detailTextLabel?.text = item.conclusion ?? "-"
				return cell
			}
		case .performes:
			let cell = tableView.dequeueReusableCell(withIdentifier: "valueCell", for: indexPath)
			cell.textLabel?.text = item.performer[indexPath.row].display
			return cell
		default:
			let cell = UITableViewCell()
			return cell
		}
	}

}
