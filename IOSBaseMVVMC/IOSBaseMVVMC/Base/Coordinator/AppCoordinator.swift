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

final class AppCoordinator: BaseCoordinator {
    
    func open() -> SlideMenuController {
        SlideMenuOptions.leftViewWidth = getWidthScreen() - 70
        //SlideMenuOptions.contentViewDrag = true
        SlideMenuOptions.panGesturesEnabled = true
    
        let menuCoordinator = MenuCoordinator(navigationController: navigationController)
        let menuController = menuCoordinator.open()
        
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        let homeController = homeCoordinator.open()
        
        let slideMenuController = SlideMenuController(mainViewController: homeController, leftMenuViewController: menuController)
        
        return slideMenuController
    }
}
