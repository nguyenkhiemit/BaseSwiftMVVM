//
//  DesignableButton.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/10/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

enum DesignableButtonStyle: Int {
    case Regular = 0
    case Light
    case Dark
    case Fancy
    case Alert
}

@IBDesignable
class DesignableButton: UIButton {
    
    @IBInspectable var buttonStyle: DesignableButtonStyle = .Regular {
        didSet {
            buttonStyleNumber = buttonType.rawValue
        }
    }
    
    @IBInspectable var buttonStyleNumber: Int = 0 {
        didSet {
            switch buttonStyleNumber {
            case DesignableButtonStyle.Light.rawValue:
                tintColor = UIColor.white
                backgroundColor = UIColor.lightGray
                break
            case DesignableButtonStyle.Dark.rawValue:
                tintColor = UIColor.white
                backgroundColor = UIColor.darkGray
                break
            case DesignableButtonStyle.Fancy.rawValue:
                tintColor = UIColor.white
                backgroundColor = UIColor.purple
                break
            case DesignableButtonStyle.Alert.rawValue:
                tintColor = UIColor.white
                backgroundColor = UIColor.red
                break
            default:
                //default Regular
                tintColor = UIColor.white
                backgroundColor = UIColor.black
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            if cornerRadius != 0 {
                self.layer.cornerRadius = cornerRadius
            }
        }
    }
    
    @IBInspectable var verticalPadding: CGFloat = 0 {
        didSet {
            contentEdgeInsets = UIEdgeInsetsMake(verticalPadding, horizontalPadding, verticalPadding, horizontalPadding)
        }
    }
    
    @IBInspectable var horizontalPadding: CGFloat = 0 {
        didSet {
            contentEdgeInsets = UIEdgeInsetsMake(verticalPadding, horizontalPadding, verticalPadding, horizontalPadding)
        }
    }
}
