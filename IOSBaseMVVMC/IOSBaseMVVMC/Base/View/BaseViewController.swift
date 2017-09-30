//
//  BaseViewController.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 9/30/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController<T>: UIViewController {

    let disposeBag = DisposeBag()
    
    var viewModel: T?
    
    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configure(viewModel: viewModel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(viewModel: T) {}
}
