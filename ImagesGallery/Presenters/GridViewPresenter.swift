//
//  GridViewPresenter.swift
//  ImagesGallery
//
//  Created by Hasan on 8/11/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit

protocol GridViewProtocol {
    func appendImages(images:[ImageModelProtocol])
    func showError(error:String)
}

class GridViewPresenter: NSObject,ImagesPresentersProtocol {

    var delegate:GridViewProtocol?
    static let PAGE_SIZE = 30
    var currentPage = 0
    var currentCount = 0
    var hasMorePages = true
    
    func loadNextPage() {
        
        if !hasMorePages {
            return
        }
        
        ImageLoader.sharedInstance.loadImagedFromPixabay(page: currentPage, size: GridViewPresenter.PAGE_SIZE, success: { (images, hasMorePages) in
            
            self.hasMorePages = hasMorePages
            if self.hasMorePages {
                self.currentPage += 1
            }
            if images.count > 0 {
                self.currentCount += images.count
                self.delegate?.appendImages(images: images)
            }
            
        }) { (errorMessage) in
            self.delegate?.showError(error: errorMessage)
        }
    }
    
    func currentRange() -> Range<Int> {
        return Range(uncheckedBounds: (lower: max(currentPage - 1,0) * GridViewPresenter.PAGE_SIZE, upper: currentCount))
    }
}
