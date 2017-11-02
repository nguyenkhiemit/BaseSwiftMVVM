//
//  AutumnViewController.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class AutumnViewController: UIViewController {

    static var Identifier = "AutumnViewController"
    
    var viewModel: AutumnViewModel?
    
    @IBOutlet weak var backButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }
    
    func bindView() {
        backButton.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(back))
        backButton.addGestureRecognizer(tapRecognizer)
    }
    
    func back() {
        self.viewModel?.back()
    }

}
