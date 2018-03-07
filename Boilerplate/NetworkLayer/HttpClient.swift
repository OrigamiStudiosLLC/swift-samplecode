//
//  APIContants.swift
//  BandPass
//
//  Created by Arslan Ilyas on 12/01/16.
//  Copyright © 2016 Rapidzz. All rights reserved.
//

import Foundation
import Alamofire

typealias HttpClientSuccess = (AnyObject?) -> ()
typealias HttpClientFailure = (NSError) -> ()

class HTTPClient {
    
    func postRequest(withApi api : API  , success : @escaping HttpClientSuccess , failure : @escaping HttpClientFailure )  {
        
        let params = api.parameters
        let method = api.method
        
       
        Alamofire.request(api.url(), method: method, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(let data):
                success(data as AnyObject?)
            case .failure(let error):
                failure(error as NSError)

            }
        }
    }
//    func postGenericRequest(withURL url : String, params: Dictionary  , success : @escaping HttpClientSuccess , failure : @escaping HttpClientFailure )  {
//        
//        
//        Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
//            
//            switch(response.result) {
//            case .success(let data):
//                success(data as AnyObject?)
//            case .failure(let error):
//                failure(error as NSError)
//                
//            }
//        }
//    }
}
