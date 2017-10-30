//
//  ChatController.swift
//  PeTalk
//
//  Created by 和田　継嗣 on 2017/08/10.
//  Copyright © 2017年 和田　継嗣. All rights reserved.
//

import Foundation
import UIKit

class ChatController:UIViewController,UITextFieldDelegate{
    
    
    fileprivate var backImage:UIImageView!
    //テキスト入力画面
    fileprivate var myChatField: UITextField!
    
    //背景画像用View
    
    fileprivate var backImageView:UIImageView!
    
    //キャラView
    fileprivate var charaImageView:UIImageView!
    
    //チャット吹き出し
    fileprivate var hukidasiView:SpringLabel!
    //url関連
    let urlhost:String = "http://153.121.44.98/peTalkServer/chie/chie.php"
    
    var chatText:String! = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackImage()
        self.setCharaImage()
        self.setTextArea()
        self.setHukidasiView()
        self.setOtherView()
        
    }
    
    func setBackImage(){
        self.backImage = UIImageView(frame:CGRect(x:0,y:0,width:self.view.frame.size.width,
                                                  height:self.view.frame.size.height))
        backImage.image = UIImage(named:"nekoback.jpg")
        self.backImage.alpha = 0.5
        self.view.addSubview(backImage)

        backImageView = UIImageView(frame:CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height))
        backImageView.image = UIImage(named:"catback.jpg")
        //self.view.addSubview(backImageView)
        self.view.backgroundColor = UIColorFromRGB(0xFFD57A)//UIColorFromRGB(0xFF3399)
    }
    
    func setCharaImage(){
        charaImageView = UIImageView(frame:CGRect(x:self.view.frame.size.width/2-60,y:self.view.frame.size.height/2-60,width:120,height:120))
        charaImageView.image = UIImage(named:"cat.png")
        self.view.addSubview(charaImageView)
    }
    
    func setTextArea(){
        let posX: CGFloat = 30
        let posY: CGFloat = self.view.bounds.height - 60
        let buttonX:CGFloat = self.view.frame.size.width - 55
        let buttonY:CGFloat = self.view.frame.size.height - 60
        myChatField = UITextField(frame: CGRect(x: posX, y: posY, width: self.view.frame.size.width-posX-60, height: 55))
        myChatField.text = ""
        myChatField.placeholder = "何か喋って見てください"
        myChatField.delegate = self
        myChatField.borderStyle = .roundedRect
        myChatField.clearButtonMode = .whileEditing
        myChatField.backgroundColor = UIColorFromRGB(0xFFFFFF)
        self.view.addSubview(myChatField)
        
        let chatButton = UIButton(frame:CGRect(x:buttonX,y:buttonY,width:50,height:50))
        chatButton.addTarget(self, action: #selector(ChatController.postChatRequest), for: .touchUpInside)
        chatButton.layer.cornerRadius = 25.0
        chatButton.setTitle("発言", for: .normal)
        chatButton.backgroundColor = UIColor.blue
        self.view.addSubview(chatButton)

    }
    
    func setOtherView(){
        var backView = UIButton(frame:CGRect(x:30,y:30,width:50,height:50))
        backView.setImage(UIImage(named:"lines-menu.png"), for: .normal)
        backView.addTarget(self, action: "showSlide", for: .touchUpInside)
        self.view.addSubview(backView)
    }
    
    func showSlide(){
        self.slideMenuController()?.openLeft()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.configureObserver()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        self.removeObserver() // Notificationを画面が消えるときに削除
    }
    
    
}

extension ChatController{
    func setHukidasiView(){
        self.hukidasiView = SpringLabel(frame:CGRect(x:self.view.frame.size.width/2-150,y:70,width:300,height:120))
        self.hukidasiView.backgroundColor = UIColor.clear
        self.hukidasiView.text = "ヤッホー"
        self.hukidasiView.backgroundColor = UIColor.clear
        self.hukidasiView.numberOfLines = 0
        self.hukidasiView.animation = "fadeInUp"
        self.hukidasiView.curve = "easeIn"
        self.hukidasiView.duration = 3.0
        self.hukidasiView.textColor = UIColor.white
        self.hukidasiView.lineBreakMode = .byWordWrapping
        self.view.addSubview(hukidasiView)
    }
}


extension ChatController{
    
    func postChatRequest(){
        let request: Request = Request()
        let urlString = self.urlhost.appending("?query=\(self.chatText!)")
        let requestString = urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let url: URL = URL(string: requestString)!
        try request.get(url: url, completionHandler: { data, response, error in
            var personalData: Data =  data!//da.data(using: String.Encoding.utf8)!
            do {
                let json = try JSONSerialization.jsonObject(with: personalData, options: JSONSerialization.ReadingOptions.allowFragments) // JSONパース。optionsは型推論可
                let top = json as! NSDictionary // トップレベルが配列
                var answer:String? = top["answer"] as? String
                
                if let checker = answer{
                }else{
                    answer = ""
                }
                
                DispatchQueue.main.async {
                         self.hukidasiView.text = answer
                         self.hukidasiView.animation = "fadeInUp"
                         self.hukidasiView.curve = "easeIn"
                         self.hukidasiView.duration = 3.0
                         self.hukidasiView.animate()
                }
            } catch {
                print(error) // パースに失敗したときにエラーを表示
            }
        })

    }
}


//キーボード周辺
extension ChatController{
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
        self.chatText = textField.text!
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
