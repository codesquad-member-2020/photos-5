//
//  PhotoManager.swift
//  PhotosApp
//
//  Created by Cloud on 2020/03/17.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Photos

class PhotoManager: NSObject {
    
    private let manager: PHCachingImageManager
    private var fetchResult: PHFetchResult<PHAsset>!
    private let fetchOptions: PHFetchOptions
    var count: Int {
        fetchResult.count
    }
    
    override public init() {
        manager = PHCachingImageManager()
        fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        fetchResult = PHAsset.fetchAssets(with: fetchOptions)
        super.init()
        PHPhotoLibrary.shared().register(self)
    }
    
    public func load(index: Int, size: CGSize) -> AnyObject? {
        var image: AnyObject?
        
        manager.requestImage(
            for: fetchResult[index],
            targetSize: size,
            contentMode: .aspectFill,
            options: .none
        ) { photo, _ in
            image = photo
        }
        
        return image
    }
    
    public func reloadAsset() {
        fetchResult = PHAsset.fetchAssets(with: fetchOptions)
    }
}

extension PhotoManager: PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        if let changes = changeInstance.changeDetails(for: fetchResult) {
            reloadAsset()
            if changes.hasIncrementalChanges {
                if let removed = changes.removedIndexes, removed.count > 0 {
                    NotificationCenter.default.post(name: Notification.Name.needToAssetReload,
                                                    object: nil,
                                                    userInfo: ["removed" : removed])
                }
                if let inserted = changes.insertedIndexes, inserted.count > 0 {
                    NotificationCenter.default.post(name: Notification.Name.needToAssetReload,
                                                    object: nil,
                                                    userInfo: ["inserted" : inserted])
                    
                }
                if let changed = changes.changedIndexes, changed.count > 0 {
                    NotificationCenter.default.post(name: Notification.Name.needToAssetReload,
                                                    object: nil,
                                                    userInfo: ["changed" : changed])
                }
            }
        }
    }
}

extension Notification.Name {
    static let needToAssetReload = Notification.Name("needToAssetReload")
}
