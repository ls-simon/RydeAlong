//
//  Vehicle.swift
//  Ridealong
//
//  Created by SImon Nielsen on 26/09/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//


import UIKit
import RealmSwift

	
class Vehicle: Object {
    let types = ["s":"Sedan","t":"Truck","sv":"SUV","c":"Coupe"]
    //Properties
    @objc  dynamic var make: String = ""
    @objc dynamic var model: String = ""
    @objc var year: Int = 0
    @objc var cylinder: Int = 0
    @objc dynamic var type: String = ""
    @objc var isDefault: Bool = false
    
    //Init
    convenience init?(make: String, model: String, year: Int, type: String, isDefault: Bool){
        self.init()
        self.make = make
        self.model = model
        self.year = year
        self.isDefault = isDefault
    
    }


}
	
