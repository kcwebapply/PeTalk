//
//  ChatView.swift
//  PeTalk
//
//  Created by 和田　継嗣 on 2017/08/20.
//  Copyright © 2017年 和田　継嗣. All rights reserved.
//

import Foundation
import UIKit


class ChatView:UIView,UITextViewDelegate{
    
    var iconView:UIImageView = UIImageView()
    var chatText:UITextView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    
    
    init(frame:CGRect,type:String,chara:UIImage,text:String){
        super.init(frame: frame)
        if(type == "me"){
            iconView = UIImageView(frame:CGRect(x:10,y:20,width:self.frame.height-40,height:self.frame.height-40))
            chatText = UITextView(frame:CGRect(x:70,y:5,width:self.frame.size.width-80,height:self.frame.height-10))
        }else{
            iconView = UIImageView(frame:CGRect(x:self.frame.width-60,y:20,width:self.frame.height-40,height:self.frame.height-40))
            chatText = UITextView(frame:CGRect(x:10,y:5,width:self.frame.size.width-80,height:self.frame.height-10))
            chatText.textAlignment = .right
        }
        
        let chatWidth = self.frame.size.width-80
        
        iconView.image = chara
        chatText.delegate = self
        chatText.text = text
        chatText.isUserInteractionEnabled = false
        self.addSubview(iconView)
        self.addSubview(chatText)
        
        let size:CGSize = chatText.sizeThatFits(chatText.frame.size)
        chatText.frame.size.height = size.height
        chatText.layer.cornerRadius = size.height/4
        chatText.frame.origin.y = (self.frame.size.height - chatText.frame.size.height)/2

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
