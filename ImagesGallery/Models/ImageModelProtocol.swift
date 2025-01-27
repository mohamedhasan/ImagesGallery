//
//  ImageModelProtocol.swift
//  ImagesGallery
//
//  Created by Hasan on 8/11/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import Foundation

protocol ImageModelProtocol {
   
    func previewUrl() -> String
    func fullImageUrl() -> String
    func imageWidth() -> Int
    func imageHeight() -> Int
}
