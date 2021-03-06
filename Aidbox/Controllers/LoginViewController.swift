//
//  LoginViewController.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 08.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit
import EDControllers

class LoginViewController: EDViewController {

	@IBOutlet weak var emailField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	@IBOutlet weak var loginButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
		emailField.text = "test@mail.com"
		passwordField.text = "123qwe"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	@IBAction func loginAction(_ sender: Any) {
		if let email = emailField.text, let password = passwordField.text {
			progress(true)
			UserManager.instance.login(email: email, password: password) { [unowned self] (error, user) in
				self.progress(false)
				if error != nil {
					self.alertWithType(type: .error, message: "Problem with authorization")
				}
				else {
					self.backAction()
//					print("user \(String(describing: user?.patientId))")
//					print("\(String(describing: self.presentedViewController)) \(String(describing: self.presentingViewController)) \(String(describing: self.navigationController))")
				}


			}
		}

	}

}
