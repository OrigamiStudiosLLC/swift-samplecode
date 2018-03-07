//
//  League.swift
//  Shkendija
//
//  Created by Adnan Ahmad on 18/09/2017.
//  Copyright © 2017 Adnan Ahmad. All rights reserved.
//

import UIKit
import ObjectMapper

class League: Mappable {
    
    var leagueID: String?
    var title: String?
    var picture: String?
    var name:String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map){
        
        leagueID <- map["leagueID"]
        title <- map["title"]
        picture <- map["picture"]
        name <- map["name"]
    }
}
