//
//  ViewController.swift
//  ThinkMe
//
//  Created by chetaofeng on 16/8/10.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if !userDefaults.boolForKey("hasShowedGuide") {
            if let guidePageVC = UIStoryboard(name: "Guide", bundle: nil).instantiateViewControllerWithIdentifier("guidePageViewController")  as? GuidePageViewController {
                presentViewController(guidePageVC, animated: true, completion: nil)
            }
        }

    }
    
}

