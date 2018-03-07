//
//  UITextField+Extensions.swift
//  Boilerplate
//
//  Created by Syed Qasim on 31/01/2018.
//  Copyright © 2018 Crewlogix. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
    func isValidField() -> Bool {
        if self.isSecureTextEntry{
            // This is password field
            return !self.emptyFieldCheck()//self.isValidPassword()
        }
        switch self.keyboardType {
        case UIKeyboardType.default:
            return self.emptyFieldCheck()
            
        case UIKeyboardType.numbersAndPunctuation:
            break
        case UIKeyboardType.numberPad:
            break
        case UIKeyboardType.URL:
            break
        case UIKeyboardType.phonePad:
            return self.validatePhone()
            
        case UIKeyboardType.emailAddress:
            return self.isValidEmail()
            
        default:
            
            break
            
        }
        
    return true
    }
    func emptyFieldCheck() -> Bool {
//        if (count(text) > 0){
//            return true
//        }
        
        return (self.text?.isEmpty)!
//        return Int(self.text?.count) > minCount
    }
    func validatePhone() -> Bool {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self.text)
        return result
    }
    /// validate an email for the right format
    func isValidEmail() -> Bool {
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: self.text)
    }
    func isValidPassword() -> Bool {
        
        
        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: self.text)
    }
}
