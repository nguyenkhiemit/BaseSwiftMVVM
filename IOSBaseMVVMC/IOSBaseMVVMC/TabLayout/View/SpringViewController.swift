//
//  SpringViewController.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SpringViewController: UIViewController {
    
    static var Identifier = "SpringViewController"
    
    var viewModel: SpringViewModel?
    
    @IBOutlet weak var backButton: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }
    
    func bindView() {
        backButton.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(back))
        backButton.addGestureRecognizer(tapRecognizer)
        
        nextButton.rx.tap.subscribe(onNext: {
            [weak self] _ in
            self?.viewModel?.next()
        }).disposed(by: disposeBag)
    }
    
    func back() {
        viewModel?.back()
    }

}
