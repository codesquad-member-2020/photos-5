//
//  ViewController.swift
//  PhotosApp
//
//  Created by 신한섭 on 2020/03/16.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let dataManager = DataManager()
    private var photosView: PhotosView {
        view as! PhotosView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photosView.collectionView.dataSource = dataManager
        photosView.collectionView.delegate = dataManager
    }
}
    
    
