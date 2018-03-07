
//
//  APIContants.swift
//  BandPass
//
//  Created by Arslan Ilyas on 12/01/16.
//  Copyright © 2016 Rapidzz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias OptionalDictionary = [String : String]?
typealias OptionalSwiftJSONParameters = [String : JSON]?

infix operator =>
infix operator =|
infix operator =<
infix operator =/

func =>(key : String, json : OptionalSwiftJSONParameters) -> String?{
    return json?[key]?.stringValue
}

func =<(key : String, json : OptionalSwiftJSONParameters) -> Double?{
    return json?[key]?.double
}

func =|(key : String, json : OptionalSwiftJSONParameters) -> [JSON]?{
    return json?[key]?.arrayValue
}

func =/(key : String, json : OptionalSwiftJSONParameters) -> Int?{
    return json?[key]?.intValue
}

prefix operator ¿
prefix func ¿(value : String?) -> String {
    return value.unwrap()
}


protocol Router {
    var route : String { get }
    var baseURL : String { get }
    var parameters : OptionalDictionary { get }
    var method : Alamofire.HTTPMethod { get }
}



enum API {
    
    static func mapKeysAndValues(keys : [String]?,values : [String]?) -> [String : String]?{
        guard let tempValues = values,let tempKeys = keys else { return nil}
        var params = [String : String]()
        for (key,value) in zip(tempKeys,tempValues) {
            params[key] = ¿value
        }
        return params
    }
    
    case loginUser(email:String?, password:String?)
    case registerUser(firstName: String, lastName: String, username: String, password:String, confirmPassword:String)
    case forgotPassword(email: String)
    case resetPassword(email: String, code: String, password: String, confirmPassword: String)
    case verifyCode(email: String, code: String)
    
}


extension API : Router{
    
    var route : String {
        switch self {
         case .loginUser(_):
            return APIPaths.doLogin
        case .registerUser(_):
            return APIPaths.doRegister
        case .forgotPassword(_):
            return APIPaths.doForgotPasswordRequest
        case .resetPassword(_):
            return APIPaths.doResetPasswordRequest
        case .verifyCode(_):
            return APIPaths.doVerifyCode
        }
        
        
    }
    
    
    var baseURL : String {  return APIConstants.BasePath }
    
    var parameters : OptionalDictionary {
        return formatParameters()
    }
    
    func url() -> String {return baseURL + route}
    var method: Alamofire.HTTPMethod {
        
        switch self {
            
            
        case .loginUser(_):
            return .post
        case .registerUser(_):
            return .post
        case .forgotPassword(_):
            return .post
        case .resetPassword(_):
            return .post
        case .verifyCode(_):
            return .post
            
        }
    }
}

extension API {
    func formatParameters() -> OptionalDictionary {
        
        switch self {
            
         
        case .loginUser(email: let email, password: let pass):
            return API.mapKeysAndValues(keys: APIParameterConstants.User.user, values:[¿email, pass!])

        case .registerUser(firstName: let fName, lastName: let lName, username: let email, password: let pass, confirmPassword: let cPass):
            return API.mapKeysAndValues(keys: APIParameterConstants.Signup.signup, values: [¿fName, lName, email, pass, cPass])
//            return API.mapKeysAndValues(keys: APIParameterConstants.Quotes.Quotes, values:[¿fName, lName, pass, cPass])

        case .forgotPassword(email: let forgotEmail):
            return API.mapKeysAndValues(keys: APIParameterConstants.ForgotPassword.forgotPassword, values:[¿forgotEmail])

        case .resetPassword(email: let email, code: let code, password: let pass, confirmPassword: let cPass):
            return API.mapKeysAndValues(keys: APIParameterConstants.ResetPassword.resetPassword, values: [¿email, ¿code, pass, cPass])
        case .verifyCode(email: let email, code: let code):
            return API.mapKeysAndValues(keys: APIParameterConstants.VerifyCode.verifyCode, values: [¿email, ¿code])
        }
    }
}

