//
//  File.swift
//  NewProject
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

class Food: NSObject, NSCoding{
    var foodName: String?
    var foodImage: UIImage?
//    var foodDescription: String?
//    var foodCategory: String?
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(foodName, forKey: "nameKey")
        aCoder.encode(foodImage, forKey: "imageKey")
//        aCoder.encode(foodDescription, forKey: "descriptionKey")
//        aCoder.encode(foodCategory, forKey: "categoryKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        foodName = aDecoder.decodeObject(forKey: "nameKey") as? String
        foodImage = aDecoder.decodeObject(forKey: "imageKey") as? UIImage
//        foodDescription = aDecoder.decodeObject(forKey: "descriptionKey") as? String
//        foodCategory = aDecoder.decodeObject(forKey: "categoryKey") as? String
    }
    
    init(name: String?, img: UIImage?){
        foodName = name
        foodImage = img
    }
    
    static let DocumentsDirectory=FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchievURL=DocumentsDirectory.appendingPathComponent("Food")
}
