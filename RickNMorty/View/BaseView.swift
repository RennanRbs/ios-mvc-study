//
//  BaseView.swift
//  RickNMorty
//
//  Created by Gabriel Palhares on 11/09/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

open class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    required public init() {
        super.init(frame: CGRect.zero)
        self.setup()
    }
    
    open func initialize() {}
    
    open func addViews() {}
    
    open func autoLayout() {}
    
    override open func didMoveToSuperview() {
        autoLayout()
    }
    private func setup() {
        self.initialize()
        self.addViews()
    }
}
