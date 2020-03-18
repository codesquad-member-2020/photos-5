//
//  PhotoManager.swift
//  PhotosApp
//
//  Created by Cloud on 2020/03/17.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Photos

class PhotoManager {
    
    private let manager: PHCachingImageManager
    private let fetchResult: PHFetchResult<PHAsset>!
    private let fetchOptions: PHFetchOptions
    var count: Int {
        fetchResult.count
    }
    
    public init() {
        manager = PHCachingImageManager()
        fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        fetchResult = PHAsset.fetchAssets(with: fetchOptions)
    }
    
    public func load(index: Int, size: CGSize, cell: PhotoCell) {
        manager.requestImage(
            for: fetchResult[index],
            targetSize: size,
            contentMode: .aspectFill,
            options: .none
        ) { image, _ in
            cell.apply(with: image)
        }
    }
}
