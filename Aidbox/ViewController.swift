//
//  ViewController.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 06.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit
import EDControllers

class ViewController: EDViewController, UIWebViewDelegate {

	lazy var loginController : UIViewController = {
		return self.storyboard!.instantiateViewController(withIdentifier: "loginViewController")
	}()

	lazy var homeController : UINavigationController = {
		return self.storyboard!.instantiateViewController(withIdentifier: "homeNavigationController") as! UINavigationController
	}()
	

	override func viewDidLoad() {
		super.viewDidLoad()

		NotificationCenter.default.addObserver(self, selector: #selector(userDidLogout), name: Notification.Name(rawValue: "userDidLogout"), object: nil)
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		if !UserManager.instance.isLoggedIn {
			performSegue(withIdentifier: "performLogin", sender: nil)
		}
		else {
			performSegue(withIdentifier: "performInfo", sender: nil)
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func userDidLogout() {


		presentedViewController?.dismiss(animated: true, completion: { [unowned self] in
			self.presentedViewController?.dismiss(animated: true, completion: nil)
		})
	}
}

