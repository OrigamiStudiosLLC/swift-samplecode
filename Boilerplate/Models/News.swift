//
//  News.swift
//  Shkendija
//
//  Created by Adnan Ahmad on 18/09/2017.
//  Copyright © 2017 Adnan Ahmad. All rights reserved.
//

import UIKit
import ObjectMapper

class News: Mappable {

    var newsID: String?
    var title: String?
    var picture: String?
    var shortDescription:String?
    var longDescription:String?
    var isBreakingNews:String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map){
        
        newsID <- map["newsID"]
        title <- map["title"]
        picture <- map["picture"]
        shortDescription <- map["shortDescription"]
        longDescription <- map["longDescription"]
        isBreakingNews <- map["isBreakingNews"]
    }
}
