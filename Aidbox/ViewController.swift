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

	let controller = EDHTMLViewController()

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		if !UserManager.instance.isLoggedIn {
			performSegue(withIdentifier: "performLogin", sender: nil)
		}

//		let string = "\(UserManager.instance.clientTokenURI)?client_id=\(UserManager.instance.clientId)&scope=\(UserManager.instance.clientScope)&redirect_uri=\(UserManager.instance.clientRedirectURI)"
//		let request = URLRequest(url: URL(string: string)!)
//
//
//		present(controller, animated: true) { [unowned self] in
//			self.controller.webView.loadRequest(request)
//			self.controller.webView.delegate = self
//		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
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

