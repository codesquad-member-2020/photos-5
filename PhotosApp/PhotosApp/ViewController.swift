//
//  ViewController.swift
//  PhotosApp
//
//  Created by 신한섭 on 2020/03/16.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var photosView: PhotosView {
        view as! PhotosView
    }
    
    private let dataManager: DataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosView.collectionView.dataSource = dataManager
        photosView.collectionView.delegate = dataManager
    }
}

