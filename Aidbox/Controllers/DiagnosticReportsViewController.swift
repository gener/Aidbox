//
//  DiagnosticReportsViewController.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 20.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit
import EDControllers

class DiagnosticReportsViewController: EDTableViewController {

	var items : [DiagnosticReport] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.tableFooterView = UIView()
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 100

		title = "Diagnostic Reports"
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		loadData()
	}

	fileprivate func loadData() {
		progress(true)
		items = []
		WebService.instance.manager.request(Endpoint.diagnosticReports).responseJSON(completionHandler: {[unowned self] (response) in
			self.progress(false)
			if let result = response.result.value as? [AnyHashable: Any], let items = result["entry"] as? [NSDictionary] {
				for row in items {
					let tmp = DiagnosticReport(dictionary: (row.value(forKey: "resource") as! NSDictionary))
					self.items.append(tmp)
				}
				self.tableView.reloadData()
			}

		})
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "diagnosticDetail", let indexPath = tableView.indexPathForSelectedRow, let controller = segue.destination as? DiagnosticReportViewController {
			controller.item = items[indexPath.row]
		}
	}

	//MARK: - TableView

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! DiagnosticReportItemTableViewCell
		cell.diagnosticReport = items[indexPath.row]
		return cell
	}
}
