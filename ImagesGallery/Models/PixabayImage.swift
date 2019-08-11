//
//  PixabayImage.swift
//  ImagesGallery
//
//  Created by Hasan on 8/11/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit

class PixabayImageObject: NSObject,ImageModelProtocol,Codable {
    
    var id: Int
    var largeImageURL: String
    var previewURL: String
    var webformatHeight: Int
    var webformatWidth: Int
    
    func previewUrl() -> String {
        return previewURL
    }
    
    func fullImageUrl() -> String {
        return largeImageURL
    }
    
    func imageWidth() -> Int {
        return webformatWidth
    }
    
    func imageHeight() -> Int {
        return webformatHeight
    }
}

class PixabayImage: NSObject,Codable {

    var totalHits: Int
    var total: Int
    var hits : [PixabayImageObject]
    
}
