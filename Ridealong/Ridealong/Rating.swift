//
//  Rating.swift
//  Ridealong
//	//  Created by SImon Nielsen on 28/09/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import RealmSwift

class Rating: Object{
    
    
    @objc dynamic var rating : Int = 0
    @objc dynamic var rideDescription : String = " "
    var user_rated: User?
    var user_rating: User?
    @objc dynamic var date: Date = Date(timeIntervalSinceNow: 1)
    //RATING FUNCTIONS
    
    /*
     1. We would want to allow users to give others users a rating 2 hours after an accepted ride.
     2. We want to present the rating with pictures of stars.
     3. We want to store it in Realm and present an average rating at the users dashboard.
     4. We want to withhold the rating information and option of rating back for the rated user A until user A has rated back.
     */
    
    convenience init?(user_rating: User, user_rated: User, rating: Int, rideDescription: String){
        self.init()
        self.user_rating = user_rating
        self.user_rated = user_rated
        self.rating = rating
        self.rideDescription = rideDescription
    }
    
    func authorizeUserToRate(){
        
    }
    
    
    
}
