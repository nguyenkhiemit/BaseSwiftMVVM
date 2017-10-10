//
//  DesignableView.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/10/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableView: UIView {
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            if cornerRadius != 0 {
                self.layer.cornerRadius = cornerRadius
            }
        }
    }
}
