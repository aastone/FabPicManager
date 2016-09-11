//
//  FPMMainViewController.swift
//  FabPicManager
//
//  Created by stone on 16/9/10.
//  Copyright © 2016年 Stone. All rights reserved.
//

import UIKit
import Photos

class FPMMainViewController: STNViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        requestPhotoAccess()
        let manager = PHImageManager.defaultManager()
        
        let albumResults = PHAssetCollection.fetchAssetCollectionsWithType(.Album, subtype: .AlbumRegular, options: nil)
        
        
        let asset = PHAsset.fetchAssetsInAssetCollection(albumResults.firstObject as! PHAssetCollection, options: nil)
        
        manager.requestImageForAsset(asset.lastObject as! PHAsset, targetSize: CGSizeMake(40, 40), contentMode: .AspectFit, options: nil) { (image, _) in
            self.mainImage.image = image
        }
        
    }
    
    // MARK: CollectionView
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = FPMBasicPhotoCollectionViewCell.init()
        
        return cell
    }
    
    
    // MARK:
    func requestPhotoAccess() -> Void {
        PHPhotoLibrary.requestAuthorization { (result) in
            if result == PHAuthorizationStatus.Authorized{
                print("YES")
            }else {
                print("NO")
            }
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBtnPressed(sender: AnyObject) {
        
    }
    
    
    func gotoViewController(nameOfVC: String) -> Void {
        let nextVC = storyboard?.instantiateViewControllerWithIdentifier(nameOfVC)
        navigationController?.pushViewController(nextVC!, animated: true)
    }
}
