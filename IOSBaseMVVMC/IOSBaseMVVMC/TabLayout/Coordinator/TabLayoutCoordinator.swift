//
//  TabbarCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

protocol TabLayoutCoordinatorDelegate {
    func back()
}

class TabLayoutCoordinator: BaseCoordinator {
    let nav1 = UINavigationController()
    let nav2 = UINavigationController()
    
    override func start() {
        let viewModel = TabLayoutViewModel()
        viewModel.delegate = self
        let tabLayoutStoryboard: UIStoryboard = UIStoryboard(name: "TabLayout", bundle: nil)
        let tabLayoutViewController = tabLayoutStoryboard.instantiateViewController(withIdentifier: TabLayoutViewController.Identifier) as! TabLayoutViewController
        tabLayoutViewController.viewModel = viewModel
        self.navigationController?.pushViewController(tabLayoutViewController, animated: true)
        
        nav1.isNavigationBarHidden = true
        let winterCoordinator = WinterCoordinator(navigationController: nav1)
        winterCoordinator.delegate = self
        winterCoordinator.start()
        tabLayoutViewController.addChildViewController(nav1)
        let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        nav1.tabBarItem = tabOneBarItem
        
        nav2.isNavigationBarHidden = true
        let springCoordinator = SpringCoordinator(navigationController: nav2)
        springCoordinator.delegate = self
        springCoordinator.start()
        tabLayoutViewController.addChildViewController(nav2)
        let tabTwoBarItem = UITabBarItem(title: "Tab 2", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        nav2.tabBarItem = tabTwoBarItem
        
        tabLayoutViewController.viewControllers = [nav1, nav2]
    }
}

extension TabLayoutCoordinator: TabLayoutCoordinatorDelegate {
    
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
