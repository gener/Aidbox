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
		homeController.dismiss(animated: true, completion: nil)
	}

//	func getToken(by code: String) {
//		let string = "\(UserManager.instance.clientAuthorizeURI)?client_id=\(UserManager.instance.clientId)&scope=\(UserManager.instance.clientScope)&redirect_uri=\(UserManager.instance.clientRedirectURI)&grant_type=authorization_code&client_secret=\(UserManager.instance.clientSecret)&code=\(code)"
//		let request = URLRequest(url: URL(string: string)!)
//		controller.webView.loadRequest(request)
//	}
//
//	// MARK: - UIWebViewDelegate
//
//	func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
//		if let url = request.url {
//			print("load URL \(url)")
//			if url.absoluteString.contains(UserManager.instance.clientRedirectURI), let code = url.queryItems["code"] {
//				print("URL = \(url.absoluteString)")
//				print("items \(url.queryItems)")
//				getToken(by: code)
//				return false
//			}
//		}
//		return true
//
//	}



}

