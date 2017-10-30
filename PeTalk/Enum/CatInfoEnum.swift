//
//  CatInfoEnum.swift
//  PeTalk
//
//  Created by 和田　継嗣 on 2017/09/03.
//  Copyright © 2017年 和田　継嗣. All rights reserved.
//

import Foundation
import UIKit

enum CatEnum{
    
    case Mike
    case Kuro
    case White
    case Scotish
    case Bengal
    case Mantikan
    
    static let values = [Mike,Kuro,White,Scotish,Bengal,Mantikan]
    
    var CatImage:UIImage{
        switch self{
            case .Mike:return UIImage(named:"mike.png")!
            case .Kuro:return UIImage(named:"kuro.png")!
            case .White:return UIImage(named:"kuro.png")!
            case .Scotish:return UIImage(named:"kuro.png")!
            case .Bengal:return UIImage(named:"kuro.png")!
            case .Mantikan:return UIImage(named:"kuro.png")!
        }
    }
    
    
    
    var catName:String{
        switch self{
            case .Mike:return "mike"
            case .Kuro:return "kuro"
            case .White:return "white"
            case .Scotish:return "scotish"
            case .Bengal:return "bengal"
            case .Mantikan:return "mantikan"
        }
    }
    
    
    
    static func getCatEnum(catName:String) -> CatEnum{
        return CatEnum.values.filter{$0.catName == catName}.first!
    }
    
}
