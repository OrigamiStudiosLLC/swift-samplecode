
//
//  APIContants.swift
//  BandPass
//
//  Created by Arslan Ilyas on 12/01/16.
//  Copyright © 2016 Rapidzz. All rights reserved.
//

import Foundation


internal struct APIConstants {
    //WARNING: add your own base url
    static let BasePath = "<ENTER_YOUR_BASE_URL>"

}


internal struct APIPaths {
  
    static let doLogin = "login"
    static let doRegister = "register"
    static let doForgotPasswordRequest =  "password/forget"
    static let doResetPasswordRequest =  "password/change"
    static let doVerifyCode = "password/reset"
//    static let getAllLeagusRecords = "getAllLeagusRecords"
    
}
internal struct MacroConstants {
    
    static let KFailureLog = "failureLog"
    
    
}

internal struct MagicNumbers{
    static let API_SUCCESS_CODE = 200
    
    
}
internal struct FormatParameterKeys{
    static let method = "method"
    static let categoryID = "categoryID"
    static let leagueID = "leagueID"
    
    static let email = "email"
    static let password = "password"
    static let username = "username"
    
    static let firstName = "first_name"
    static let lastName = "last_name"
    static let confirmPasword = "password_confirmation"
    
    static let code = "code"
    
    

}

internal struct APIParameterConstants {

//    struct Quotes
//    {
//        let full = APIConstants.BasePath+APIPaths.getAllNewsRecords
//        static let Quotes = [FormatParameterKeys.categoryID]
//    }
//    struct Categories {
//        static let Categories = [FormatParameterKeys.method]
//    }
    struct User
    {
        static let user = [FormatParameterKeys.username, FormatParameterKeys.password]
    }
    struct Signup
    {
        static let signup = [FormatParameterKeys.firstName, FormatParameterKeys.lastName, FormatParameterKeys.username, FormatParameterKeys.password, FormatParameterKeys.confirmPasword]
    }
    struct ForgotPassword
    {
        static let forgotPassword = [FormatParameterKeys.firstName, FormatParameterKeys.lastName, FormatParameterKeys.username, FormatParameterKeys.password, FormatParameterKeys.confirmPasword]
    }
    struct ResetPassword
    {
        static let resetPassword = [FormatParameterKeys.email, FormatParameterKeys.code, FormatParameterKeys.password, FormatParameterKeys.confirmPasword]
    }
    struct VerifyCode
    {
        static let verifyCode = [FormatParameterKeys.email, FormatParameterKeys.code]
    }
}
