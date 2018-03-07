//
//  String+Extensions.swift
//  Boilerplate
//
//  Created by Syed Qasim on 26/01/2018.
//  Copyright © 2018 Crewlogix. All rights reserved.
//

import Foundation
import UIKit


protocol StringType { var get: String { get } }
extension String: StringType { var get: String { return self } }
extension Optional where Wrapped: StringType {
    func unwrap() -> String {
        return self?.get ?? ""
    }
}



extension String {
    ///Call this method to get a Double type value from a Literal String
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
    
//    var trim :  String{
//    return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
//    }
    
    
    
    /// Call this method to get an attiributedString with bold range and you given font
    func boldString(fontSize : CGFloat ,font : UIFont?) -> NSMutableAttributedString {
        let attrs = [NSAttributedStringKey.font : font ?? UIFont.systemFont(ofSize: 8)]
        return NSMutableAttributedString(string:self, attributes:attrs)
    }
    ///Call this method to get a Float type value from a Literal String
    var floatValue: Float {
        return (self as NSString).floatValue
    }

    
 
    
 
}

