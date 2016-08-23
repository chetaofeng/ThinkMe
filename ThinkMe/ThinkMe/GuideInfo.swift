 //
//  GuideInfo.swift
//  ThinkMe
//
//  Created by chetaofeng on 16/8/23.
//  Copyright © 2016年 gsunis. All rights reserved.
//

class GuideInfo: NSObject {
    func addGuideInfo() -> Void {
       
        //保存页面导航相关信息
        var headers = ["私人定制","餐馆定位","美食发现"]
        var images  = ["foodpin-intro-1","foodpin-intro-2","foodpin-intro-3"]
        var footers = ["好店随时加，打造自己的美食向导","马上找到美味大餐的位置","发现其它吃货的美食珍藏"]
        
        for index in 0 ..< headers.count {
            let guideInfo = AVObject(className: "GuideInfo")
            guideInfo["title"] = headers[index]
            guideInfo["subTitle"] = footers[index]
            guideInfo["imageUrl"] = "https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/logo_white_fe6da1ec.png"
            guideInfo["image"] = AVFile(name: "\(images[index]).png", data: UIImagePNGRepresentation(UIImage(named: "\(images[index])")!))
            guideInfo["type"] = 1
            
            guideInfo.saveInBackgroundWithBlock { (isSucc, error) in
                if isSucc
                {
                    print("保存导航信息成功")
                }else{
                    print(error)
                }
            }
        }
        
        let guideInfo = AVObject(className: "GuideInfo")
        guideInfo["title"] = "欢迎使用"
        guideInfo["subTitle"] = "祝您使用本软件愉快"
        guideInfo["imageUrl"] = "https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/logo_white_fe6da1ec.png"
        guideInfo["image"] = AVFile(name: "image2.jpg", data:UIImageJPEGRepresentation(UIImage(named: "image2")!, 1))
        guideInfo["type"] = 0
        
        guideInfo.saveInBackgroundWithBlock { (isSucc, error) in
            if isSucc
            {
                print("保存启动信息成功")
            }else{
                print(error)
            }
        }
    }
    
    func queryGuideInfoByType(type:Int) -> [AVObject]{
        var guideInfos : [AVObject] = []
        let query = AVQuery(className: "GuideInfo")
        query.whereKey("type", equalTo: type)
        guideInfos = (query.findObjects() as? [AVObject])!;
        
        return guideInfos
    }
}
