//
//  HomeViewController.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 9/29/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftEventBus
import SlideMenuControllerSwift

class HomeViewController: UIViewController {

    var viewModel: HomeViewModel?
    
    @IBOutlet weak var menuButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        SwiftEventBus.onMainThread(self, name: "index") { (notification) in
            self.viewModel?.openNewScreen(index: notification.object as! Int)
        }
    }
    
    func bindView() {
        menuButton.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(openMenu))
        menuButton.addGestureRecognizer(tapRecognizer)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        SwiftEventBus.unregister(self)
    }
    
    func openMenu() {
        self.slideMenuController()?.openLeft()
    }

}
