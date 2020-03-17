//
//  PhotoCell.swift
//  PhotosApp
//
//  Created by 신한섭 on 2020/03/17.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func apply(with image: UIImage) {
        self.imageView.image = image
    }
}
