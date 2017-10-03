//
//  RegisterViewController.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var viewModel: RegisterViewModel?
    
    static var Identifier = "RegisterViewController"
    
    @IBOutlet weak var backButton: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func bindView() {
        backButton.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(back))
        backButton.addGestureRecognizer(tapRecognizer)
    }
    
    func back() {
        viewModel?.back()
    }
}
