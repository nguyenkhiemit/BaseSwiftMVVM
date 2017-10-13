//
//  ChangeLanguageUtils.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/13/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class ChangeLanguageUtils: NSObject {
    
    static func loadNib() -> UILoading? {
        return Bundle.main.loadNibNamed("UIChangeLanguageView", owner: self, options: nil)?.first as? UILoading
    }
    
    static func show() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        if let contentView = loadNib() {
            contentView.frame = window.bounds
            contentView.tag = 2000
            contentView.activityIndicatorView.startAnimating()
            window.addSubview(contentView)
        }
    }
    
    static func close() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        if let contentView = window.viewWithTag(2000) {
            contentView.removeFromSuperview()
        }
    }
}
