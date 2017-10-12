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
    
    static let instance = UILoading()
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    func show() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        window.addSubview(self)
        //activityIndicatorView.startAnimating()
    }
    
    func dismiss() {
        //activityIndicatorView.stopAnimating()
        removeFromSuperview()
    }
}
