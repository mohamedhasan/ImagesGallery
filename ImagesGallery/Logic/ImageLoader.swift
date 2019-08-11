//
//  ImageLoader.swift
//  ImagesGallery
//
//  Created by Hasan on 8/11/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit

class ImageLoader: NSObject {

    static let sharedInstance = ImageLoader()
    
    func loadImagedFromPixabay() {
        let request = PixabayRequest.init(paramters: ["q":"faces"])
        NetworkManager.sharedInstance.perfromRequest(request: request, of: PixabayImage.self, completion: { (response) in
            
        }) { (errorMessage) in
            
        }
    }
    
}
