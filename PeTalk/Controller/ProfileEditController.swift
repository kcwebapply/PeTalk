//
//  ProfileEditController.swift
//  PeTalk
//
//  Created by 和田　継嗣 on 2017/08/19.
//  Copyright © 2017年 和田　継嗣. All rights reserved.
//

import Foundation
import UIKit


class ProfileEditController:UIViewController,UITextFieldDelegate{
    
    var backImage:UIImageView!
    
    var catImage:UIImageView!
    
    var myNameView:CatTextField!
    
    var catNameView:CatTextField!
    
    var catType:CatEnum!
    
    var profileDB = ProfileInfo()
    
    var profileDataStore:ProfileInfo!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor  = UIColor.red
        setProfileInfo()
        setView()
        setTextViews()
    }
    
    
    func setProfileInfo(){
        profileDataStore = profileDB.getMyProfile()
        
    }
    
    func setTextViews(){
        //猫画像
        let catSize = self.view.frame.size.height/3-100
        catImage = UIImageView(frame:CGRect(
            x:(self.view.frame.size.width-catSize)/2,y:80,
                                            width:catSize,
                                            height:catSize))
        catImage.image = CatEnum.getCatEnum(catName: profileDataStore.catType).CatImage
        //自分自身の名前
      /*  let myNameLabel = UILabel(frame:CGRect(x:20,y:self.view.frame.size.height/3-35,
                                            width:self.view.frame.size.width/2,height:30))
        myNameLabel.text = "自分の名前"
        myNameLabel.textColor = UIColor.white
        self.view.addSubview(myNameLabel)*/
        myNameView = CatTextField(frame:CGRect(x:20,y:self.view.frame.size.height/3,
                                              width:self.view.frame.size.width-40,
                                              height:50),title: "自分の名前",backColor:UIColor.white)
        myNameView.delegate = self
        myNameView.layer.cornerRadius = 10.0
        myNameView.tag = 0
        //猫の名前

        catNameView = CatTextField(frame:CGRect(x:20,y:self.view.frame.size.height/2,
                                              width:self.view.frame.size.width-40,
                                              height:50),title:"猫の名前",backColor:UIColor.white)
        catNameView.layer.cornerRadius = 10.0
        catNameView.delegate = self
        catNameView.tag = 1
        
        
        self.view.addSubview(catImage)
        self.view.addSubview(myNameView)
        self.view.addSubview(catNameView)
        //情報セット
        myNameView.text = profileDataStore.userName
        catNameView.text = profileDataStore.catName
        catType = CatEnum.getCatEnum(catName: profileDataStore.catType)
    }
    
    
    func setView(){
        self.backImage = UIImageView(
            frame:CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height))
        backImage.image = UIImage(named:"nekoback.jpg")
        backImage.alpha = 0.5
        self.view.backgroundColor = UIColorFromRGB(0xFFD57A)
        self.view.addSubview(backImage)
        let backView = UIButton(frame:CGRect(x:30,y:30,width:50,height:50))
        backView.setImage(UIImage(named:"lines-menu.png"), for: .normal)
        backView.addTarget(self, action: "showSlide", for: .touchUpInside)
        self.view.addSubview(backView)
    }
    
    
    func showSlide(){
        self.slideMenuController()?.openLeft()
    }
    

}

//キーボード周辺
extension ProfileEditController{
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
     UITextFieldが編集された直前に呼ばれる
     */
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing: \(textField.text!)")
    }
    
    /*
     UITextFieldが編集された直後に呼ばれる
     */
    func textFieldDidEndEditing(_ textField: UITextField) {
       // self.chatText = textField.text!
        print("textFieldDidEndEditing: \(textField.text!)")
    }
    
    
    func configureObserver() {
        
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // Notificationを削除
    func removeObserver() {
        
        let notification = NotificationCenter.default
        notification.removeObserver(self)
    }
    
    // キーボードが現れた時に、画面全体をずらす。
    func keyboardWillShow(notification: Notification?) {
        
        let rect = (notification?.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        let duration: TimeInterval? = notification?.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double
        UIView.animate(withDuration: duration!, animations: { () in
            let transform = CGAffineTransform(translationX: 0, y: -(rect?.size.height)!)
            self.view.transform = transform
            
        })
    }
    
    // キーボードが消えたときに、画面を戻す
    func keyboardWillHide(notification: Notification?) {
        
        let duration: TimeInterval? = notification?.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? Double
        UIView.animate(withDuration: duration!, animations: { () in
            
            self.view.transform = CGAffineTransform.identity
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder() // Returnキーを押したときにキーボードを下げる
        return true
    }
    
    
}
