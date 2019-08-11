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
    
    //NOTE: max(1,page)..... Pixabay page index start from 1 not zero, so It is handled here to keep the (0) page option available for other sources
    
    func loadImages(page:Int,size:Int,success:@escaping ([ImageModelProtocol],Bool) -> Void, failure: @escaping (String) -> Void) {
        self.loadImagedFromPixabay(page: page, size: size, success: success, failure: failure)
    }
    
    func loadImagedFromPixabay(page:Int,size:Int,success:@escaping ([ImageModelProtocol],Bool) -> Void, failure: @escaping (String) -> Void) {
        
        let request = PixabayRequest.init(paramters: ["q":"images","per_page":size,"page":max(1,page)])
        NetworkManager.sharedInstance.perfromRequest(request: request, of: PixabayImage.self, completion: { (response) in
            
            let data = response as! PixabayImage
            
            //Determine if still has moreData to Paginate
            let hasMorePages = data.total > (data.totalHits * page)
            
            success(data.hits,hasMorePages)
            
            
        }) { (errorMessage) in
            failure(errorMessage)
        }
    }
    
}
