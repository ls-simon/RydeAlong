//
//  SimpleUser.swift
//  Ridealong
//
//  Created by jcrzry on 11/10/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import RealmSwift


// Properties
class SimpleUser: Object{
    @objc dynamic var firstname: String = ""
    @objc dynamic var lastname: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var bio: String = ""
    @objc dynamic var profileImage: NSData?
    @objc dynamic var defaultVehicle: Vehicle?
    
    
    //Initializers
    convenience init?(firstname: String, lastname: String, email: String, bio: String?, profileImage: NSData?, defaultVehicle: Vehicle?){
        self.init()
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.bio = bio!
        self.profileImage = profileImage!
        self.defaultVehicle = defaultVehicle!
    }
    
    
    override static func primaryKey() -> String?{
        return "email"
    }
    
}
