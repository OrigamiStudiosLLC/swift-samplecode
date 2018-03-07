
//
//  APIContants.swift
//  BandPass
//
//  Created by Arslan Ilyas on 12/01/16.
//  Copyright © 2016 Rapidzz. All rights reserved.
//
import Foundation
import SwiftyJSON
import Alamofire
import Reachability

typealias APICompletion = (APIResponse) -> ()




class APIManager: NSObject {

    static let sharedInstance = APIManager()
    private lazy var httpClient : HTTPClient = HTTPClient()
    /// USe this method if you have configured all the routes in the app and just provide an object of API type as a parameter to this method
func opertationWithRequest ( withApi api : API , completion : @escaping APICompletion )  {
    httpClient.postRequest(withApi: api, success: { (data) in
        guard let response = data else {
            completion(APIResponse.Failure(""))
            return
        }
        let json = JSON(response)
        
        print("Json,API : \(json),\(api.url())")
        
        if let status = json.dictionaryValue["responseCode"]?.int {
            if status != MagicNumbers.API_SUCCESS_CODE {
                if let message = json.dictionaryValue["message"]?.stringValue {
                    completion(APIResponse.Failure(message))
                    return
                }
                completion(APIResponse.Failure(""))
                return
            }
        }
        
        completion(.Success(api.handleResponse(parameters: json)))
        
        }) { (error) in
           //make a log
            self.generateAlog(api: api, error: error)
        print(error)
            completion(APIResponse.Failure(""))
    }
    }
/// This method can be used for any post request. provide full API url and parameters in a Dictionary
    func genericOperationWithRequest(apiURL: String, params: Parameters, success : @escaping HttpClientSuccess , failure : @escaping HttpClientFailure) {
        Alamofire.request(apiURL, method: HTTPMethod.post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(let data):
                let json = JSON(response)
                
                print("Json,API : \(json),\(apiURL)")
                
//                if let status = json.dictionaryValue["responseCode"]?.int {
//                    if status != MagicNumbers.API_SUCCESS_CODE {
//                        if let message = json.dictionaryValue["message"]?.stringValue {
//                            completion(APIResponse.Failure(message))
//                            return
//                        }
//                        failure(APIResponse.Failure(""))
//                        return
//                    }
//                }
                success(data as AnyObject?)
            case .failure(let error):
                failure(error as NSError)
                
            }
        }
        
    }
    func generateAlog(api: API, error: NSError) {
//        let network = self.getNetworkStatus()
        let reachability = Reachability()!
        var network:String = ""
        
        
        reachability.whenUnreachable = { _ in
            network = "Internet not reachable"
        }
        reachability.whenReachable = { reachability in
            switch reachability.connection{
                
            case .none:
                network = "Internet not reachable"
                break
            case .wifi:
                network = "wifi internet"
                break
            case .cellular:
                network = "cellular"
                break
            }
        }
        if UserDefaults.standard.object(forKey: MacroConstants.KFailureLog) == nil{
            // no log available yet
            var failureLogArray:Array<Dictionary<String, String>> = []
            
            let failureLog = ["method":api.url(), "cause":error.userInfo.debugDescription, "network":network] as [String : String]
            failureLogArray.append(failureLog)
            UserDefaults.standard.set(failureLogArray, forKey: MacroConstants.KFailureLog)
            
        }else{
            // some log is saved in "failureLog" array. Fetch failureLog array and add new log
            var failureLog: Array<Dictionary<String, String>> = UserDefaults.standard.object(forKey: MacroConstants.KFailureLog) as! Array<Dictionary<String, String>>
            failureLog.append(["method":api.url(), "cause":error.userInfo.debugDescription, "network":network])
            print(failureLog)
            UserDefaults.standard.set(failureLog, forKey: MacroConstants.KFailureLog)
        }
    }
    func getNetworkStatus() -> String {
        let reachability = Reachability()!
        var network:String = ""
        
        
        reachability.whenUnreachable = { _ in
            network = "Internet not reachable"
        }
        reachability.whenReachable = { reachability in
            switch reachability.connection{
                
            case .none:
                network = "Internet not reachable"
                break
            case .wifi:
                network = "wifi internet"
                break
            case .cellular:
                network = "cellular"
                break
            }
        }
        return network
    }
}



