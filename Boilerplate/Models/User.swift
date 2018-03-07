//
//  User.swift
//  Boilerplate
//
//  Created by Syed Qasim on 01/02/2018.
//  Copyright © 2018 Crewlogix. All rights reserved.
//

import UIKit
import ObjectMapper
class User: Mappable {
    
    var userID: String?
    var firstName: String?
    var lastName: String?
    var username:String?
    var gender:String?
    var email:String?
    var status:String?
    var confirmation_code:String?
    var confirmed:NSNumber?
    var fb_id:String?
    var avatar:String?
    var age:NSNumber?
    var fullName:String?
    var name:String?
    
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map){
        
        userID <- map["id"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        username <- map["username"]
        
        gender <- map["gender"]
        email <- map["email"]
        status <- map["status"]
        confirmation_code <- map["confirmation_code"]
        confirmed <- map["confirmed"]
        fb_id <- map["fb_id"]
        avatar <- map["avatar"]
        age <- map["age"]
        fullName <- map["full_name"]
        name <- map["name"]
        
    }
}
