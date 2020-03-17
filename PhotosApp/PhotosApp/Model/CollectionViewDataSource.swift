//
//  CollectionViewDataSource.swift
//  PhotosApp
//
//  Created by Cloud on 2020/03/16.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit
import Photos

class CollectionViewDataSource: NSObject {
    
    private let imageManager: PHCachingImageManager
    private var fetchResult: PHFetchResult<PHAsset>
    private let photoOptions: PHFetchOptions
    
    public override init() {
        imageManager = PHCachingImageManager()
        photoOptions = PHFetchOptions()
        photoOptions.sortDescriptors = [
            NSSortDescriptor(key: "creationDate", ascending: true)
        ]
        fetchResult = PHAsset.fetchAssets(with: photoOptions)
    }
}


extension CollectionViewDataSource: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchResult.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: UICollectionViewCell.photosCellIdentifier,
            for: indexPath
            ) as? PhotoCell else { return UICollectionViewCell() }
        imageManager.requestImage(
            for: fetchResult[indexPath.item],
            targetSize: cell.frame.size,
            contentMode: .aspectFill,
            options: .none
        ) { image, _ in
            cell.apply(with: image)
        }
        return cell
    }
}


