//
//  ImageCell.swift
//  ImagesGallery
//
//  Created by Hasan on 8/11/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView : UIImageView?
    func loadCell(model:ImageModelProtocol) {
        
        let imageUrl = model.previewUrl()
        NetworkManager.sharedInstance.downloadImage(url: imageUrl) { (data) in
            
            if let imageData = data {
                let image = UIImage(data: imageData)
                self.imageView?.image = image
            }
        }
    }

}
