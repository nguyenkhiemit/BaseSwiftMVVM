//
//  DesignableEditText.swift
//  IOSBaseMVVMC
//
//  Created by KhiemND on 10/11/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableTextField: UITextField {
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            if cornerRadius != 0 {
                self.layer.cornerRadius = cornerRadius
            }
        }
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 20))
            imageView.image = image
            imageView.tintColor = tintColor
            var width = leftPadding + 20
            if borderStyle == UITextBorderStyle.none || borderStyle == UITextBorderStyle.line {
                width = width + 5
            }
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            leftView = imageView
        } else {
            // image is nil
        }
        
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSForegroundColorAttributeName: tintColor])
    }
}
