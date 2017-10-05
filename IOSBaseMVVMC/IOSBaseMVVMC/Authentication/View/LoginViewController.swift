//
//  LoginViewController.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    static var Identifier = "LoginViewController"
    
    var viewModel: LoginViewModel?
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var backButton: UIImageView!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func bindView() {
        usernameTextField.rx.text.map {
            $0 ?? ""
        }.bindTo(viewModel!.usernameVariable)
        
        passwordTextField.rx.text.map {
            $0 ?? ""
        }.bindTo(viewModel!.passwordVariable)
        
        registerButton.rx.tap
            .debounce(0.2, scheduler: MainScheduler.instance)
            .subscribe(onNext: {
                [weak self] _ in
                self?.viewModel?.openRegisterScreen()
            }).disposed(by: disposeBag)
        
        backButton.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(back))
        backButton.addGestureRecognizer(tapRecognizer)
        
        loginButton.rx.tap
            .debounce(0.5, scheduler: MainScheduler.instance)
            .subscribe(onNext: {
                [weak self] _ in
                self?.viewModel?.login()
            }).disposed(by: disposeBag)
    }
    
    func back() {
        viewModel?.back()
    }
}
