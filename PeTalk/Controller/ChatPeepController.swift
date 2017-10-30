//
//  ChatPeepController.swift
//  PeTalk
//
//  Created by 和田　継嗣 on 2017/08/19.
//  Copyright © 2017年 和田　継嗣. All rights reserved.
//

import Foundation
import UIKit


class ChatPeepController:ViewController,UITableViewDelegate,UITableViewDataSource{
    
    var catTable:UITableView!
    
    var backImage:UIImageView!
    
    
    var catInfoList:[CatCellInfo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setOtherView()
        setTable()
    }
    
    func setTable(){
        catInfoList.append(CatCellInfo(imageName: "cat.png",catText: "猫で〜す", catId:1))
        catInfoList.append(CatCellInfo(imageName: "cat.png",catText: "猫で〜す2", catId:2))
        catInfoList.append(CatCellInfo(imageName: "cat.png",catText: "猫で〜す3", catId:1))
        catInfoList.append(CatCellInfo(imageName: "cat.png",catText: "猫で〜す4", catId:1))
        catTable = UITableView(frame:CGRect(x:0,y:self.view.frame.size.height/5,
                    width:self.view.frame.size.width,height:self.view.frame.size.height*4/5))
        catTable.backgroundColor = UIColor.clear
        catTable.separatorColor = UIColor.clear
        catTable.delegate = self
        catTable.dataSource = self
        let nib = UINib(nibName: "catCell",bundle: nil)
        self.catTable.register(nib, forCellReuseIdentifier: "catCell")
        self.view.addSubview(catTable)

    }
    
    func setOtherView(){
        self.backImage = UIImageView(frame:CGRect(x:0,y:0,width:self.view.frame.size.width,
                                                height:self.view.frame.size.height))
        backImage.image = UIImage(named:"nekoback.jpg")
        backImage.alpha = 0.5
        self.view.backgroundColor = UIColorFromRGB(0xFFD57A)
        self.view.addSubview(backImage)
        var backView = UIButton(frame:CGRect(x:30,y:30,width:50,height:50))
        backView.setImage(UIImage(named:"lines-menu.png"), for: .normal)
        backView.addTarget(self, action: "showSlide", for: .touchUpInside)
        self.view.addSubview(backView)
    }

    
    func showSlide(){
        self.slideMenuController()?.openLeft()
    }

}

extension ChatPeepController{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height/5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCell(withIdentifier: "catCell", for: indexPath as IndexPath) as! catCell
        cell.setView(cellInfo: catInfoList[indexPath.row])

        
        return cell
    }
}
