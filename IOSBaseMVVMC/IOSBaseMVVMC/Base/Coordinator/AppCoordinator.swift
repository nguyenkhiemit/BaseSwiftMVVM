//
//  AppCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 9/29/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit
import SlideMenuControllerSwift

final class AppCoordinator {
    
    func open() -> SlideMenuController {
        SlideMenuOptions.leftViewWidth = getWidthScreen() - 70
        //SlideMenuOptions.contentViewDrag = true
        SlideMenuOptions.panGesturesEnabled = true
    
        let menuCoordinator = MenuCoordinator()
        let menuController = menuCoordinator.open()
        
        let navigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        homeCoordinator.start()
        
        let slideMenuController = SlideMenuController(mainViewController: navigationController, leftMenuViewController: menuController)
        
        return slideMenuController
    }
}
