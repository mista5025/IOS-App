//
//  Travel.swift
//  ProjectA
//
//  Created by Lawrence Bang on 8/11/18.
//  Copyright © 2018 Lawrence Bang. All rights reserved.
//
import WebKit
import Foundation

class Travel: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "Name")
        aCoder.encode(self.address, forKey: "Address")
        aCoder.encode(self.descript, forKey: "DS")
        aCoder.encode(self.picture, forKey: "Image")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "Name") as! String
        self.address = aDecoder.decodeObject(forKey: "Address") as! String
        self.descript = aDecoder.decodeObject(forKey: "DS") as! String
        self.picture = aDecoder.decodeObject(forKey: "Image") as! UIImage
    }
    
    var name : String
    var address : String
    var descript : String
    var picture : UIImage
    init(name: String, address: String, ds: String, pic: UIImage) {
        self.name = name;
        self.address = address;
        self.descript = ds;
        self.picture = pic;
    }
}
