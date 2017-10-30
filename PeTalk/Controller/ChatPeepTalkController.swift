//
//  ChatPeepTalkController.swift
//  PeTalk
//
//  Created by 和田　継嗣 on 2017/08/19.
//  Copyright © 2017年 和田　継嗣. All rights reserved.
//

import Foundation
import UIKit

class ChatPeepTalkController:UIViewController{
    
    
    
    var cat1Id:Int!
    
    var cat2Id:Int!
    
    fileprivate var backImage:UIImageView!

    //テキスト入力画面
    fileprivate var myChatField: UITextField!
    
    //背景画像用View
    
    fileprivate var backImageView:UIImageView!
    
    //キャラView
    fileprivate var chara1ImageView:UIImageView!
    
    fileprivate var chara2ImageView:UIImageView!
    
    var scrollView:UIScrollView!
    
    //チャットデータ
    var chara1TextLists:[String] = []

    var chara2TextLists:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setChatList()
        setChatView()
    }
    
    func setChatList(){
        chara1TextLists.append("おはよう")
        chara1TextLists.append("読書大好き")
        chara1TextLists.append("ふ〜ん")
        chara2TextLists.append("おは〜")
        chara2TextLists.append("私は微妙かな.....私は微妙かな.....私は微妙かな.....私は微妙かな.....私は微妙かな.....私は微妙かな.....私は微妙かな.....私は微妙かな.....")
    }
    
    func setViews(){
        self.backImage = UIImageView(frame:CGRect(x:0,y:0,width:self.view.frame.size.width,
                                                  height:self.view.frame.size.height))
        backImage.image = UIImage(named:"nekoback.jpg")
        backImage.alpha = 0.5
        self.view.addSubview(backImage)
        self.view.backgroundColor = UIColorFromRGB(0xFFD57A)
        //もドロブトアン
        var backView = UIButton(frame:CGRect(x:30,y:30,width:50,height:50))
        backView.setImage(UIImage(named:"lines-menu.png"), for: .normal)
        backView.addTarget(self, action: "showSlide", for: .touchUpInside)
        self.view.addSubview(backView)
        
        //scrollView
        scrollView = UIScrollView(frame:CGRect(x:0,y:80,width:self.view.frame.size.width,height:self.view.frame.size.height-80))
        scrollView.contentSize = CGSize(width:self.view.frame.size.width,height:2000)
        self.view.addSubview(scrollView)
    }
    
    func setChatView(){
        var index1:Int = 0
        var index2:Int = 0
        let originChatHeight = 0
        let frameChatHeight = 100
        let frameChatWidth = self.view.frame.size.width-40
        let chatView1 = ChatView(frame:CGRect(x:10,y:originChatHeight,width:Int(frameChatWidth),height:frameChatHeight),type: "me",chara: UIImage(named:"cat.png")!,text: chara1TextLists[index1])
        chatView1.layer.cornerRadius = 20.0
        index1 += 1
        let chatView2 = ChatView(frame:CGRect(x:20,y:originChatHeight+frameChatHeight,width:Int(frameChatWidth),height:frameChatHeight),type: "you",chara: UIImage(named:"dog_akitainu.png")!,text: chara2TextLists[index2])
         chatView2.layer.cornerRadius = 20.0
        index2 += 1
        let chatView3 = ChatView(frame:CGRect(x:20,y:originChatHeight+frameChatHeight*2,width:Int(frameChatWidth),height:frameChatHeight),type: "me",chara: UIImage(named:"cat.png")!,text: chara1TextLists[index1])
         chatView3.layer.cornerRadius = 20.0
        index1 += 1
        let chatView4 = ChatView(frame:CGRect(x:20,y:originChatHeight+frameChatHeight*3,width:Int(frameChatWidth),height:frameChatHeight),type: "you",chara: UIImage(named:"dog_akitainu.png")!,text: chara2TextLists[index2])
        chatView4.layer.cornerRadius = 20.0
        index2 += 1
        let chatView5 = ChatView(frame:CGRect(x:20,y:originChatHeight+frameChatHeight*4,width:Int(frameChatWidth),height:frameChatHeight),type: "me",chara: UIImage(named:"cat.png")!,text: chara1TextLists[index1])
        chatView5.layer.cornerRadius = 20.0
        
        self.scrollView.addSubview(chatView1)
        self.scrollView.addSubview(chatView2)
        self.scrollView.addSubview(chatView3)
        self.scrollView.addSubview(chatView4)
        self.scrollView.addSubview(chatView5)
        
    }
    
    func showSlide(){
        self.slideMenuController()?.openLeft()
    }

}
