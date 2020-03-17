//
//  ViewController.swift
//  PhotosApp
//
//  Created by 신한섭 on 2020/03/16.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let datasource = CollectionViewDataSource(count: 40)
    private var size: CGSize = CGSize(width: 100, height: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = datasource
        collectionView.delegate = self
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return size
    }
}
