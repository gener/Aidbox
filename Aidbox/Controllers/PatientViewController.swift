//
//  PatientViewController.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 12.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit
import EDControllers
import AlamofireImage
import EDDateHelper

class PatientViewController: EDTableViewController {

	var patient : Patient?

    override func viewDidLoad() {
        super.viewDidLoad()

		if patient == nil {
			patient = UserManager.instance.user.patient
		}

		title = patient?.string
		tableView.tableFooterView = UIView()
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 45

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


	// MARK: - TableView

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		switch section {
		case 0:
			return nil
		case 1:
			return "Contacts"
		case 2:
			return "Addresses"
		default:
			return nil
		}
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return 3
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0:
			return 3
		case 1:
			return patient!.telecom.count
		case 2:
			return patient!.address.count
		default:
			return 0
		}
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.section == 0 && indexPath.row == 0 {
			return 100
		}
		return UITableViewAutomaticDimension
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			switch indexPath.row {
			case 0:
				let cell = tableView.dequeueReusableCell(withIdentifier: "avatarCell", for: indexPath) as! ImageTableViewCell
				if let url = patient?.photo.first?.url {
					cell.imageView!.af_setImage(withURL: url)
				}
				return cell
			case 1:
				let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
				cell.textLabel?.textAlignment = .center
				cell.textLabel?.text = patient?.string
				return cell
			case 2:
				let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
				cell.textLabel?.textAlignment = .center
				if let date = patient?.birthDate {
					cell.textLabel?.text = EDDateHelper.instance.displayDate(date)
				}
				else {
					cell.textLabel?.text = nil
				}

				return cell
			default:
				let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
				return cell

			}
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
			let contact = patient?.telecom[indexPath.row]
			cell.textLabel?.textAlignment = .left
			cell.textLabel?.text = contact?.string
			return cell
		case 2:
			let cell = tableView.dequeueReusableCell(withIdentifier: "valueCell", for: indexPath)
			let address = patient?.address[indexPath.row]
			var tmp = ""
			var el = [address?.postalCode, address?.text]
			for line in address!.line {
				el.append(line)
			}
			el.append(address?.city)
			el.append(address?.state)
			el.append(address?.country)
			for item in el {
				if let item = item {
					if tmp.characters.count > 0 {
						tmp = "\(tmp), "
					}
					tmp = tmp + item
				}
			}
			cell.detailTextLabel?.text = "\(address!.type.rawValue) \(address!.use.rawValue)"
			cell.textLabel?.text = tmp
			return cell

		default:
			let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
			return cell
		}
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
