//
//  MatchResult.swift
//  Shkendija
//
//  Created by Adnan Ahmad on 18/09/2017.
//  Copyright © 2017 Adnan Ahmad. All rights reserved.
//

import UIKit
import ObjectMapper

class MatchResult: Mappable {
    
    
    var matchResultID: String?
    var matchDate: String?
    var time: String?
    var leagueName:String?
    var teamA:String?
    var teamAlogo:String?
    var teamB:String?
    var teamBlogo:String?
    var goalTeamA:String?
    var goalTeamB:String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map){
        
        matchResultID <- map["matchResultID"]
        matchDate <- map["date"]
        time <- map["time"]
        leagueName <- map["leagueName"]
        teamA <- map["teamA"]
        teamAlogo <- map["teamAlogo"]
        teamB <- map["teamB"]
        teamBlogo <- map["teamBlogo"]
        goalTeamA <- map["goalTeamA"]
        goalTeamB <- map["goalTeamB"]

    }
}
