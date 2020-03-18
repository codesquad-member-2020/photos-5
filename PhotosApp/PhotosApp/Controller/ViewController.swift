//
//  ViewController.swift
//  PhotosApp
//
//  Created by 신한섭 on 2020/03/16.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let datasource = CollectionViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = datasource
        authorizationStatus()
    }
    
    func authorizationStatus() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAuthorizationStatus {
        case .authorized:
            collectionView.reloadData()
            
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (PHAuthorizationStatus) in
                switch(PHAuthorizationStatus) {
                case .authorized :
                    DispatchQueue.main.async {
                        self.datasource.reloadAsset()
                        self.collectionView.reloadData()
                    }
                    
                default:
                    fatalError("권한 없음")
                }
            }
            
        default:
            fatalError("권한 없음")
        }
    }
}
