//
//  BaseViewController.swift
//  ImagesGallery
//
//  Created by Hasan on 8/11/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 46))
    let activityIndicatorColor = UIColor(red: 255.0/255.0, green: 93.0/255.0, blue: 89.0/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImageView(image: UIImage(named: "logo"))
        self.navigationItem.titleView = logo
        activityIndicator.color = activityIndicatorColor
        let barItem = UIBarButtonItem(customView: activityIndicator)
        self.navigationItem.leftBarButtonItem = barItem
        
    }
    
    func showLoadingIndicator() {
        activityIndicator.startAnimating()
    }
    
    func hideLoadingIndicator() {
        activityIndicator.stopAnimating()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
