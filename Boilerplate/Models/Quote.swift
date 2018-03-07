//
//  Quote.swift
//  iQuote
//
//  Created by Adnan Ahmad on 19/03/2017.
//  Copyright © 2017 Adnan Ahmad. All rights reserved.
//

import UIKit
import ObjectMapper

class Quote: NSObject, Mappable,NSCoding {
    
    var quotationID:String?
    var categoryID:String?
    var quotation: String?
    var author: String?
    var isNew: String?
    var isQuoteOfTheDay:String?
    var created:String?
    var modified:String?
    
    required init?(map: Map){
    
    }
    
    func mapping(map: Map){
    
        quotationID <- map["quotationID"]
        categoryID <- map["categoryID"]
        quotation <- map["quotations"]
        author <- map["author"]
        isNew <- map["isNew"]
        isQuoteOfTheDay <- map["isQuoteOfTheDay"]
        created <- map["created"]
        modified <- map["modified"]
    }


    required init(coder decoder: NSCoder) {
        
        self.quotationID = decoder.decodeObject(forKey:"quotationID") as? String ?? ""
        self.categoryID = decoder.decodeObject(forKey: "categoryID") as! String?

        self.quotation = decoder.decodeObject(forKey:"quotation") as? String ?? ""
        self.author = decoder.decodeObject(forKey: "author") as! String?

        self.isNew = decoder.decodeObject(forKey:"isNew") as? String ?? ""
        self.isQuoteOfTheDay = decoder.decodeObject(forKey: "isQuoteOfTheDay") as! String?

        self.created = decoder.decodeObject(forKey:"created") as? String ?? ""
        self.modified = decoder.decodeObject(forKey: "modified") as! String?

    }
    
    func encode(with coder: NSCoder)
    {
        
        coder.encode(quotationID, forKey: "quotationID")
        coder.encode(categoryID, forKey: "categoryID")
        
        coder.encode(quotation, forKey: "quotation")
        coder.encode(author, forKey: "author")
        
        coder.encode(isNew, forKey: "isNew")
        coder.encode(isQuoteOfTheDay, forKey: "isQuoteOfTheDay")
        
        coder.encode(created, forKey: "created")
        coder.encode(modified, forKey: "modified")
        
    }
}
