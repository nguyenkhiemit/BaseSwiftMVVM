//
//  PinkViewController.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/2/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class PinkViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIImageView!

    var viewModel: PinkViewModel?
    
    static let Identifier = "PinkViewController"

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
        viewModel?.back()
    }
}
