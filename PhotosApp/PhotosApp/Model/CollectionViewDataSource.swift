//
//  CollectionViewDataSource.swift
//  PhotosApp
//
//  Created by Cloud on 2020/03/16.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class CollectionViewDataSource: NSObject {
    
    let photoManager = PhotoManager()
}

extension CollectionViewDataSource: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoManager.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoCell.identifier,
            for: indexPath
            ) as? PhotoCell else { return UICollectionViewCell() }
        photoManager.load(index: indexPath.item, size: cell.frame.size, cell: cell)
        return cell
    }
}


