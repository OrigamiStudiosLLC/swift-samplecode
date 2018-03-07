
//
//  APIContants.swift
//  BandPass
//
//  Created by Arslan Ilyas on 12/01/16.
//  Copyright © 2016 Rapidzz. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

extension API{
    
    func handleResponse(parameters : JSON?) -> AnyObject? {
        switch self {
           
        case .loginUser(_):
            
            let user = Mapper<User>().map(JSON: (parameters?.dictionaryObject)!)
            return user
            
        case .registerUser(_):
            
            let user = Mapper<User>().map(JSON: (parameters?.dictionaryObject)!)
            return user
            
        case .forgotPassword(_):
            
            let newsArray = Mapper<News>().mapArray(JSONArray:parameters?.dictionary?["data"]?.rawValue as! [[String : Any]])

            return newsArray as AnyObject?
        case .resetPassword(_):
            
            let newsArray = Mapper<News>().mapArray(JSONArray:parameters?.dictionary?["data"]?.rawValue as! [[String : Any]])
            return newsArray as AnyObject?
        
        case .verifyCode(_):
            
            let leaguesArray = Mapper<League>().mapArray(JSONArray:parameters?.dictionary?["data"]?.rawValue as! [[String : Any]])
            return leaguesArray as AnyObject?
        }
    }
}
enum APIValidation : String{
    case None
    case Success = "1"
    case ServerIssue = "500"
    case Failed = "0"
    case TokenInvalid = "401"
}


enum APIResponse {
    case Success(AnyObject?)
    case Failure(String?)
}
