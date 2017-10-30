//
//  SlideSideController.swift
//  PeTalk
//
//  Created by 和田　継嗣 on 2017/08/13.
//  Copyright © 2017年 和田　継嗣. All rights reserved.
//

import Foundation
import UIKit
import SlideMenuControllerSwift

class SlideSideController:UIViewController{
    
    

    let profileDB = ProfileInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.setSideView()
    }
    
    func setSideView(){
        
        
        var chatFoot = UIButton(frame:CGRect(x:20,y:30,width:60,height:60))
        chatFoot.setImage(UIImage(named:"catfoot.png"), for: .normal)
        self.view.addSubview(chatFoot)
        
        let imageSize = self.view.frame.size.height/4
        var profileImage = UIButton(frame:CGRect(x:120-imageSize/2,y:100,width:imageSize,height:imageSize))
        
        //猫画像を取得する
        let catType = profileDB.getMyProfile().catType
        let catImage:UIImage = CatEnum.getCatEnum(catName: catType).CatImage
        profileImage.setImage(catImage, for: .normal)
        profileImage.addTarget(self, action: "showProfile", for: .touchUpInside)
        self.view.addSubview(profileImage)
        
        let profileLabel = UILabel(frame:CGRect(x:120-imageSize/2,y:self.view.frame.size.height/2-50,width:200,height:30))
        profileLabel.text = "猫を変える"
        self.view.addSubview(profileLabel)
        
        //下のチャット選択一覧
        let chatButtonHeight = self.view.frame.size.height/2
        let chatButton = UIButton(frame:CGRect(x:20,y:chatButtonHeight,width:200,height:40))
        chatButton.setTitle("会話をする", for: .normal)
        chatButton.layer.cornerRadius = 15.0
        chatButton.addTarget(self, action: "showChat", for: .touchUpInside)
        chatButton.backgroundColor = ColorSetEnum.petChat.mainColor
        self.view.addSubview(chatButton)
        
        let peepButton = UIButton(frame:CGRect(x:20,y:chatButtonHeight + 50,width:200,height:40))
        peepButton.setTitle("会話を覗く", for: .normal)
        peepButton.layer.cornerRadius = 15.0
        peepButton.addTarget(self, action: #selector(SlideSideController.showPeep), for: .touchUpInside)
        peepButton.backgroundColor = ColorSetEnum.peepChat.mainColor
        self.view.addSubview(peepButton)
        
        let graphButton = UIButton(frame:CGRect(x:20,y:chatButtonHeight+100,width:200,height:40))
        graphButton.setTitle("相性を見る", for: .normal)
        graphButton.layer.cornerRadius = 15.0
        graphButton.addTarget(self, action: #selector(SlideSideController.showGraph), for: .touchUpInside)
        graphButton.backgroundColor = ColorSetEnum.petGraph.mainColor
        self.view.addSubview(graphButton)
        
        let shareButton = UIButton(frame:CGRect(x:20,y:chatButtonHeight+150,width:200,height:40))
        shareButton.backgroundColor = PeTalk.UIColorFromRGB(rgbValue: 0x80D8FF)
        shareButton.layer.cornerRadius = 15.0
        shareButton.addTarget(self, action: #selector(SlideSideController.setShare), for: .touchUpInside)
        shareButton.setTitle("シェアする", for: .normal)
        self.view.addSubview(shareButton)

        
    }
    
    func showChat(){
        self.slideMenuController()?.mainViewController = ChatController()
        self.slideMenuController()?.closeLeft()
    }
    
    func showPeep(){
        self.slideMenuController()?.mainViewController = ChatPeepController()//ChatPeepTalkController()
        self.slideMenuController()?.closeLeft()
    }
    
    func showGraph(){
        self.slideMenuController()?.mainViewController = GraphController()
        self.slideMenuController()?.closeLeft()
    }
    
    func showProfile(){
        self.slideMenuController()?.mainViewController = ProfileEditController()
        self.slideMenuController()?.closeLeft()
        
    }
    
    func setShare(){
        let shareText = "Apple - Apple Watch"
        let shareWebsite = NSURL(string: "https://www.apple.com/jp/watch/")!
        let shareImage = UIImage(named: "catfoot.png")!
        
        let activityItems = [shareText, shareWebsite, shareImage] as [Any]
        
        // 初期化処理
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        // 使用しないアクティビティタイプ
        let excludedActivityTypes = [
            UIActivityType.message,
            UIActivityType.saveToCameraRoll,
            UIActivityType.print
        ]
        
        activityVC.excludedActivityTypes = excludedActivityTypes
        
        // UIActivityViewControllerを表示
        self.present(activityVC, animated: true, completion: nil)    }
}
