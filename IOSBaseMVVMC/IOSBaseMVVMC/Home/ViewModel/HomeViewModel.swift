//
//  HomeViewModel.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    var delegate: HomeCoordinatorDelegate?
    
    init() {
        
    }
    
    func openNewScreen(index: Int) {
        print("Login Start !!! HomeViewModel")
        delegate?.openNewScreen(index: index)
    }
}
