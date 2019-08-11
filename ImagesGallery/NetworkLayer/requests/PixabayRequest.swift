//
//  PixabayRequest.swift
//  ImagesGallery
//
//  Created by Hasan on 8/11/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit

class PixabayRequest: NSObject,RequestProtocol {
    
    var url: String
    var method: HttpRequestMethod
    var headers: [String : String]?
    var paramters: [String : Any]?
    static let API_KEY = "13280635-bce6f1cabc8c35f25815a66f8"
    
     init(paramters:[String:Any]) {
        
        self.url = "https://pixabay.com/api/"
        self.method = .get
        self.headers = nil
        self.paramters = paramters
        self.paramters!["key"] = PixabayRequest.API_KEY
    }
    

}
