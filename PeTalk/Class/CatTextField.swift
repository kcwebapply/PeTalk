//
//  CatTextField.swift
//  PeTalk
//
//  Created by 和田　継嗣 on 2017/09/03.
//  Copyright © 2017年 和田　継嗣. All rights reserved.
//

import Foundation
import UIKit

class CatTextField:UITextField{
    
    var subLabel:UILabel!
    
    init(frame: CGRect,title:String!,backColor:UIColor) {
        super.init(frame: frame)
        subLabel = UILabel(frame:CGRect(x:0,y:-15,width:100,height:30))
        subLabel.layer.cornerRadius = 10.0
        subLabel.font = UIFont.systemFont(ofSize: 10.0)
        subLabel.clipsToBounds = true
        subLabel.backgroundColor = backColor
        self.backgroundColor = backColor
        subLabel.text = title
        self.addSubview(subLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
