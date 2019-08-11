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
    @IBOutlet weak var buttonReload : UIButton?
    
    var cachedModel : ImageModelProtocol?
    
    func loadCell(model:ImageModelProtocol) {
        cachedModel = model
        loadImage()
    }
    
    func loadImage() {
        
        self.imageView?.image = nil
        buttonReload?.alpha = 0
        let imageUrl = cachedModel!.previewUrl()
        
        imageView?.image = UIImage(named: "placeholder")
        imageView?.contentMode = .scaleAspectFill
        
        NetworkManager.sharedInstance.downloadImage(url: imageUrl) { (data) in
            
            if let imageData = data {
                let image = UIImage(data: imageData)
                if image != nil {
                    self.imageView?.image = image
                    self.imageView?.contentMode = .scaleAspectFill
                } else {
                    self.showReload()
                }
            } else {
                self.showReload()
            }
        }
    }
    
    func showReload() {
        buttonReload?.alpha = 1
        self.imageView?.image = UIImage(named: "sadFace")
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    @IBAction func reload() {
        loadImage()
    }

}
