//
//  DataManager.swift
//  PhotosApp
//
//  Created by 신한섭 on 2020/03/16.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    private func generateRandomColor() -> UIColor {
        let range: Range<CGFloat> = (1..<255)
        let red = CGFloat.random(in: range) / 255
        let green = CGFloat.random(in: range) / 255
        let blue = CGFloat.random(in: range) / 255
        let alpha = CGFloat.random(in: 0.5..<1)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension DataManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)
        let color = generateRandomColor()
        cell.backgroundColor = color
        return cell
    }
}

extension DataManager: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}
