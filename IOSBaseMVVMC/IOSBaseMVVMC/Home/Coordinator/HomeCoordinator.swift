//
//  HomeCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

final class HomeCoordinator: BaseCoordinator {
    
    func open() -> HomeViewController {
        let homeStoryBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let homeController = homeStoryBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        return homeController
    }
}
