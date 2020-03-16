//
//  ViewController.swift
//  PhotosApp
//
//  Created by 신한섭 on 2020/03/16.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var photosView: PhotosView {
        view as! PhotosView
    }
    
    let dataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosView.collectionView.dataSource = dataManager
    }


}

