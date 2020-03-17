//
//  CollectionViewDataSource.swift
//  PhotosApp
//
//  Created by Cloud on 2020/03/16.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class CollectionViewDataSource: NSObject {
    
    private let count: Int
    
    public init(count: Int) {
        self.count = count
    }
}

extension CollectionViewDataSource: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: UICollectionViewCell.photosCellIdentifier,
            for: indexPath
            ) as? PhotoCell else {return UICollectionViewCell()}
        cell.backgroundColor = .randomColor
        return cell
    }
}


