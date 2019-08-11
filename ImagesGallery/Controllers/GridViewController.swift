//
//  GridViewController.swift
//  ImagesGallery
//
//  Created by Hasan on 8/11/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit

class GridViewController: BaseViewController,GridViewProtocol {
   
    var dataSource : [ImageModelProtocol] = []
    @IBOutlet weak var collectionView : UICollectionView?
    let presenter = GridViewPresenter()
    var updateInProgess = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }
    
    func prepareCollectionView() {
        let collectionViewLayout = collectionView?.collectionViewLayout as! LiquidCollectionViewLayout
        collectionViewLayout.delegate = self
        collectionViewLayout.minimumInteritemSpacing = 3
        collectionViewLayout.minimumLineSpacing = 3
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func loadData() {
        presenter.delegate = self
        updateInProgess = true
        showLoadingIndicator()
        presenter.loadNextPage()
    }

    func appendImages(images: [ImageModelProtocol]) {
        
        hideLoadingIndicator()
        self.dataSource.append(contentsOf: images)
        var indexPathes = [IndexPath]()
        for i in self.presenter.currentRange() {
            let indexPath = IndexPath(row: i, section: 0)
            indexPathes.append(indexPath)
        }
        
        self.collectionView?.performBatchUpdates({
            self.collectionView?.insertItems(at:indexPathes)
        }, completion: { (finished) in
            self.updateInProgess = !finished
        })
        
    }
    
    
    
    //For now just show an alert to the user
    func showError(error: String) {
        
        hideLoadingIndicator()
        updateInProgess = false
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
        }
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
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

extension GridViewController : UICollectionViewDelegate,UICollectionViewDataSource,LiquidLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let imageModel = dataSource[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell",for: indexPath) as! ImageCell
        cell.loadCell(model: imageModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == dataSource.count - 1 && !updateInProgess{
            
            updateInProgess = true
            showLoadingIndicator()
            self.presenter.loadNextPage()
        }
    }
    
    func collectionView(collectionView: UICollectionView, heightForCellAtIndexPath indexPath: IndexPath, width: CGFloat) -> CGFloat {
        let image = dataSource[indexPath.row]

        let actualWidth = CGFloat(image.imageWidth())
        let actualHeight = CGFloat(image.imageHeight())
        
        return (actualHeight * CGFloat(width)) / actualWidth
    }
    
    
}
