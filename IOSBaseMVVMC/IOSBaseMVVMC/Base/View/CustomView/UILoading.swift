//
//  Loading.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/11/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

class UILoading: UIView {

    static func loadNib() -> UILoading? {
        return Bundle.main.loadNibNamed("UILoading", owner: self, options: nil)?.first as? UILoading
    }
    
    static func show() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        if let contentView = loadNib() {
            contentView.frame = window.bounds
            contentView.tag = 1000
            window.addSubview(contentView)
        }
    }
    
    static func dismiss() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        if let contentView = window.viewWithTag(1000) {
            contentView.removeFromSuperview()
        }
    }
}
