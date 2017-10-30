//
//  ColorSetEnum.swift
//  PeTalk
//
//  Created by 和田　継嗣 on 2017/08/13.
//  Copyright © 2017年 和田　継嗣. All rights reserved.
//

import Foundation
import UIKit

enum ColorSetEnum{
    case petChat
    case peepChat
    case petGraph
    case partColor
    
    var mainColor:UIColor{
        switch self{
        case .petChat:return UIColorFromRGB(rgbValue: 0xFF6BA9)
        case .peepChat:return UIColorFromRGB(rgbValue: 0xBBFF9C)
        case .petGraph:return UIColorFromRGB(rgbValue: 0xFFC700)
        case .partColor:return UIColorFromRGB(rgbValue: 0xF5C07A)
        }
        
    }
}

extension UIColor {
    static var theme: UIColor {
        return UIColorFromRGB(rgbValue: 0xFF6BA9)
    }
}
