//
//  HomeViewController.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 11.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit
import EDControllers
import SideMenu

class HomeViewController: EDViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		SideMenuManager.menuFadeStatusBar = false
		SideMenuManager.menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "leftViewnavController") as? UISideMenuNavigationController
		SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
		SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func menuAction(_ sender: UIBarButtonItem) {
		present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
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
