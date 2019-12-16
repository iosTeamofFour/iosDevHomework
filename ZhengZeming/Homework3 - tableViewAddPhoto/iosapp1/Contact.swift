//
//  Contact.swift
//  iosapp1
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit
class Contact:NSObject,NSCoding{
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name,forKey: "nameKey")
        aCoder.encode(phoneNumber,forKey: "phoneNumberKey")
//        aCoder.encode(contactCategory,forKey:"contactCategoryKey")
         aCoder.encode(avatar,forKey: "avatarKey")
    }
   
    required init?(coder aDecoder: NSCoder) {
        name=aDecoder.decodeObject(forKey:"nameKey")as?String
        phoneNumber=aDecoder.decodeObject(forKey:"phoneNumberKey")as?String
        avatar=aDecoder.decodeObject(forKey: "avatarKey")as?UIImage
//        contactCategory=aDecoder.decodeObject(forKey:"contactCategoryKey")as?String
    }
    
    var name:String?
    var phoneNumber:String?
   // var contactCategory:String?
    var avatar:UIImage?
    init(name:String?,phoneNumber:String?,avatar:UIImage?)
    {
        self.name=name
        self.phoneNumber=phoneNumber
        self.avatar=avatar
    }
    static let DocumentsDirectory=FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL=DocumentsDirectory.appendingPathComponent("ContatcList")
}
