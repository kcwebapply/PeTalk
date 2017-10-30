//
//  CatCellinfo.swift
//  PeTalk
//
//  Created by 和田　継嗣 on 2017/09/02.
//  Copyright © 2017年 和田　継嗣. All rights reserved.
//

import Foundation
import UIKit

class CatCellInfo:NSObject{
    
    var imageName:String!
    
    var catText:String!
    
    var catId:Int!
    
    init(imageName:String,catText:String,catId:Int){
        self.imageName = imageName
        self.catText = catText
        self.catId = catId
    }
}
