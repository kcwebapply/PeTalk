
//
//  RealmDB.swift
//  PeTalk
//
//  Created by 和田　継嗣 on 2017/09/03.
//  Copyright © 2017年 和田　継嗣. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class ProfileInfo:Object{
    
    static let realm = try! Realm()

    dynamic var id = ""
    dynamic var userName = ""
    dynamic var catName = ""
    dynamic var catType = ""
    
    override class func primaryKey() -> String{
        return "id"
    }
    
    //プロフィール情報を取得する
    func getMyProfile() -> ProfileInfo{
        let profileObj = ProfileInfo.realm.objects(ProfileInfo)
        if(profileObj.count != 0){
            print("データあるね")
            return profileObj.last!
        }else{
            let profileObj = ProfileInfo()
            profileObj.id = getLastId()
            profileObj.userName = "名無しさん"
            profileObj.catType = "mike"
            profileObj.catName = "みつお"
            try! ProfileInfo.realm.write{
                ProfileInfo.realm.add(profileObj)
            }

            print("データ作成")
            return profileObj
        }
    }
    
    //プロフィール編集
    func changeMYProfile(userName:String,catName:String!,catType:String){
        let obj = ProfileInfo()
        obj.id = getLastId()
        obj.userName = userName
        obj.catName = catName
        obj.catType = catType
        try! ProfileInfo.realm.write{
            ProfileInfo.realm.add(obj)
        }
    }
    //id取得　なければ端末番号を渡す
    private func getLastId()-> String{
        let lastObj = ProfileInfo.realm.objects(ProfileInfo).last
        if(lastObj != nil && lastObj?.id != nil){
            return (lastObj?.id)!
        }else{
            return UIDevice.current.identifierForVendor!.uuidString
        }
    }
}
