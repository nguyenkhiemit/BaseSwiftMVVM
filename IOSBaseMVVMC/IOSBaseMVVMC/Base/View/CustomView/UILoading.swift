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
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    func show() {
        activityIndicatorView.startAnimating()
    }
    
    func dismiss() {
        activityIndicatorView.stopAnimating()
    }
}
