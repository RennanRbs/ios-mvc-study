//
//  UIView+Addsubviews.swift
//  RickNMorty
//
//  Created by Thalys Viana on 29/10/20.
//  Copyright © 2020 Gabriel Palhares. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}

