//
//  GuideContentViewController.swift
//  ThinkMe
//
//  Created by chetaofeng on 16/8/22.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class GuideContentViewController: UIViewController {
    
    @IBOutlet weak var guideHeader: UILabel!
    @IBOutlet weak var guideFooter: UILabel!
    @IBOutlet weak var guideImageView: UIImageView!
    @IBOutlet weak var guidePageCtrl: UIPageControl!
    @IBOutlet weak var guideDoneBth: UIButton!
    
    
    var index         = 0
    var header        = ""
    var footer        = ""
    var imageViewName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guideHeader.text = header
        guideFooter.text = footer
        guideImageView.image = UIImage(named: imageViewName)
        
        guidePageCtrl.currentPage = index
        if index == 2 { //最后一页的时候，显示立即体验按钮
            guideDoneBth.hidden = false
        }else{
            guideDoneBth.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func guideDoneBtnTapped(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setBool(true, forKey: "hasShowedGuide")
        
        dismissViewControllerAnimated(true, completion: nil)//隐藏以模态形式弹出的导航页面
    }
}
