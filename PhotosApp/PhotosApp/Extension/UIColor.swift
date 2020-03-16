//
//  UIColor.swift
//  PhotosApp
//
//  Created by Cloud on 2020/03/16.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

extension UIColor {
    static var randomColor: UIColor {
        let range: Range<CGFloat> = (0..<255)
        let red: CGFloat = CGFloat.random(in: range) / 255
        let green: CGFloat = CGFloat.random(in: range) / 255
        let blue: CGFloat = CGFloat.random(in: range) / 255
        let alpha: CGFloat = CGFloat.random(in: (0.5..<1))
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
