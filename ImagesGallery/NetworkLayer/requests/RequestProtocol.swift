//
//  RequestProtocol.swift
//  ImagesGallery
//
//  Created by Hasan on 8/11/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import Foundation

enum HttpRequestMethod {
    case get
    case post
}

protocol RequestProtocol {
    var url : String { get set }
    var method : HttpRequestMethod { get set }
    var headers : [String:String]? { get set }
    var paramters : [String:Any]? { get set }
}
