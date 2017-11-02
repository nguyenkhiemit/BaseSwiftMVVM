//
//  EmptyTextUtils.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/30/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class EmptyTextUtils: UIView {
    
    static func loadLib() -> UIEmptyText? {
        return Bundle.main.loadNibNamed("UIEmptyText", owner: self, options: nil)?.first as? UIEmptyText
    }
    
    static func show(view: UIView) {
        if let contentView = loadLib() {
            contentView.frame = view.bounds
            contentView.tag = 10000
            view.addSubview(contentView)
        }
    }
    
    static func hidden(view: UIView) {
        if let contentView = view.viewWithTag(10000) {
            contentView.removeFromSuperview()
        }
    }

}
