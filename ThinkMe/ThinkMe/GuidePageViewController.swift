//
//  GuidePageViewController.swift
//  ThinkMe
//
//  Created by chetaofeng on 16/8/22.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class GuidePageViewController: UIPageViewController,UIPageViewControllerDataSource{

    var guideInfos:[AVObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        let guideInfo = GuideInfo()
        guideInfos = guideInfo.queryGuideInfoByType(1)
        //设置第一个页面
        if let startVC = viewControllerAtIndex(0) {
            setViewControllers([startVC], direction: .Forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GuideContentViewController).index
        index -= 1
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GuideContentViewController).index
        index += 1
        return viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index:Int) -> GuideContentViewController? {
        if case 0 ..< guideInfos.count = index {
            if let contentVC = storyboard?.instantiateViewControllerWithIdentifier("guideContentController") as? GuideContentViewController {
                let obj:AVObject = guideInfos[index]
                contentVC.footer        = obj["title"] as! String
                contentVC.imageViewData = (obj["image"] as! AVFile).getData()
                contentVC.header        = obj["subTitle"] as! String
                contentVC.index         = index
                contentVC.count         = guideInfos.count
                return contentVC
            }
        }
        
        return nil
    }
}
