//
//  HMNavigationControllerViewController.swift
//  20151221
//
//  Created by SinObjectC on 15/12/22.
//  Copyright © 2015年 SinObjectC. All rights reserved.
//

import UIKit

class HMNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBar.appearance()
        appearance.setBackgroundImage(UIImage(named: "top_navigation_background"), forBarMetrics: UIBarMetrics.Default)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
