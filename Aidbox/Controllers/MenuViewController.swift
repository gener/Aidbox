//
//  MenuViewController.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 11.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

	@IBOutlet weak var patientName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

		patientName.text = UserManager.instance.user.email

		tableView.tableFooterView = UIView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

	@IBAction func logoutAction(_ sender: Any) {
		UserManager.instance.logout()
	}

}
