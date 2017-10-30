//
//  catCell.swift
//  PeTalk
//
//  Created by 和田　継嗣 on 2017/09/02.
//  Copyright © 2017年 和田　継嗣. All rights reserved.
//

import Foundation
import UIKit

class catCell:UITableViewCell{
    
    @IBOutlet weak var CatIconView: UIImageView!
    
    @IBOutlet weak var catIntroView: UITextView!

    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var catFootView: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
    
    func setView(cellInfo:CatCellInfo){
        self.backgroundColor = UIColor.clear
        self.backLabel.backgroundColor = UIColor.white
        self.backLabel.clipsToBounds = true
        self.backLabel.layer.borderWidth = 2.0
        self.backLabel.layer.borderColor = UIColorFromRGB(rgbValue: 0xFFC27A).cgColor
        self.backLabel.layer.cornerRadius = 20.0
        self.CatIconView.image = UIImage(named:cellInfo.imageName)
        self.CatIconView.isUserInteractionEnabled = false
        self.catIntroView.text = cellInfo.catText
        self.catIntroView.isUserInteractionEnabled = false
        self.catFootView.image = UIImage(named:"catfoot.png")
   }
    

}
