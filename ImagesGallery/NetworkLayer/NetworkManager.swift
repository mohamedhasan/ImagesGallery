//
//  NetworkManager.swift
//  ImagesGallery
//
//  Created by Hasan on 8/11/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager: NSObject {

    static let sharedInstance = NetworkManager()
    
    func connectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    func alarmofireHttpMethodMapping(_ method:HttpRequestMethod) -> HTTPMethod {
    
        //For simplicity I will handle get post only now :)
        switch method {
        case .post:
            return HTTPMethod.post
        default:
            return HTTPMethod.get
        }
    }
    
    func perfromRequest <T : Codable>(request:RequestProtocol, of type: T.Type, completion: @escaping (AnyObject?) -> Void, error:@escaping (String) -> Void) {
        
        if !connectedToInternet() {
            error("No Connection")
            return
        }
        
        let url = URL(string: request.url)
        let headers = request.headers
        let paramters = request.paramters
        let httpMethod = alarmofireHttpMethodMapping(request.method)
        
        URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)

        Alamofire.request(url!, method: httpMethod, parameters: paramters, encoding: URLEncoding.default, headers: headers).validate().responseJSON { (response) -> Void in
            
            guard response.result.isSuccess else {
                error(String(describing: response.result.error))
                print("Error while fetching: \(String(describing: response.result.error))")
                return
            }
        
            if let data = try? JSONSerialization.data(withJSONObject: response.result.value!, options: .prettyPrinted) {
                let model = self.decodeModel(data: data, type: type)
                completion(model as AnyObject)
            }
        }
    }
    
    func decodeModel <T : Codable>(data:Any,type:T.Type) -> Decodable?  {
        do{
            let decoder = JSONDecoder()
            let model = try decoder.decode(type, from: data as! Data)
            return model
        }
        catch {
            print("error parsing")
        }
        return nil
    }
        
    func downloadImage(url:String,handler:@escaping (Data?) -> Void)  {
        
        URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        Alamofire.request(URL(string:url)!, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseJSON { (response) -> Void in
            handler(response.data)
        }
    }
}
