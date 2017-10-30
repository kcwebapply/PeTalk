//
//  BalloonView.swift
//  PeTalk
//
//  Created by 和田　継嗣 on 2017/08/13.
//  Copyright © 2017年 和田　継嗣. All rights reserved.
//

import Foundation
import UIKit

class BalloonView: UITextView {
    
    let triangleSideLength: CGFloat = 20
    let triangleHeight: CGFloat = 17.3
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.green.cgColor)
        contextBalloonPath(context: context!, rect: rect)
    }
    
    func contextBalloonPath(context: CGContext, rect: CGRect) {
        let triangleRightCorner = (x: (rect.size.width + triangleSideLength) / 2, y: rect.maxY - triangleHeight)
        let triangleBottomCorner = (x: rect.size.width / 2, y: rect.maxY)
        let triangleLeftCorner = (x: (rect.size.width - triangleSideLength) / 2, y: rect.maxY - triangleHeight)
        
        // 塗りつぶし
        context.addRect(CGRect(x:0, y:0, width:10, height: rect.size.height - triangleHeight))
        context.fillPath()
        context.move(to: CGPoint(x:triangleLeftCorner.x, y:triangleLeftCorner.y))
        context.move(to: CGPoint(x:triangleBottomCorner.x, y:triangleBottomCorner.y))
        //context.move(to:CGPoint(x:triangleRightCorner.x, y:triangleRightCorner.y))
        context.fillPath()
    }
    
}
