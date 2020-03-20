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
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reloadAsset(_:)),
                                               name: Notification.Name.needToAssetReload,
                                               object: nil)
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
    
    @objc func reloadAsset(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            DispatchQueue.main.async {
                self.collectionView.performBatchUpdates({
                    if userInfo["removed"] != nil {
                        guard let removed = userInfo["removed"] as? IndexSet else {return}
                        self.collectionView.deleteItems(at: removed.map { IndexPath(item: $0, section:0) })
                    }
                    
                    if userInfo["inserted"] != nil{
                        guard let inserted = userInfo["inserted"] as? IndexSet else {return}
                        self.collectionView.insertItems(at: inserted.map { IndexPath(item: $0, section:0) })
                    }
                    if userInfo["changed"] != nil {
                        guard let changed = userInfo["changed"] as? IndexSet else {return}
                        self.collectionView.reloadItems(at: changed.map { IndexPath(item: $0, section:0) })
                    }
                })
            }
        }
    }
}
