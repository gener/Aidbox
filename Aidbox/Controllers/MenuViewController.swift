//
//  MenuViewController.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 11.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit
import AlamofireImage

class MenuViewController: UITableViewController {

	@IBOutlet weak var patientName: UILabel!
	@IBOutlet weak var avatarView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

		patientName.text = UserManager.instance.user.patient.string
		if let image = UserManager.instance.user.patient.photo.first, let url = image.url {
			avatarView.af_setImage(withURL: url)
		}


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
