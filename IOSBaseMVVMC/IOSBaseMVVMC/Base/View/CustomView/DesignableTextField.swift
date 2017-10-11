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
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            if cornerRadius != 0 {
                self.layer.cornerRadius = cornerRadius
            }
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            if borderWidth != 0 {
                self.layer.borderWidth = borderWidth
            }
        }
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var paddingImageToBorder: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var widthImage: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var heightImage: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var paddingImageToTitle: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let leftImage = leftImage {
            leftViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: paddingImageToBorder, y: 0, width: widthImage, height: heightImage))
            imageView.image = leftImage
            var width = paddingImageToBorder + widthImage
            if borderStyle == UITextBorderStyle.none || borderStyle == UITextBorderStyle.line {
                width = width + paddingImageToTitle
            }
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: heightImage))
            view.addSubview(imageView)
            leftView = view
        }
        
        if let rightImage = rightImage {
            rightViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: paddingImageToTitle, y: 0, width: widthImage, height: heightImage))
            imageView.image = rightImage
            var width = paddingImageToTitle + widthImage
            if borderStyle == UITextBorderStyle.none || borderStyle == UITextBorderStyle.line {
                width = width + paddingImageToBorder
            }
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: heightImage))
            view.addSubview(imageView)
            rightView = view
        }
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSForegroundColorAttributeName: tintColor])
    }
}
