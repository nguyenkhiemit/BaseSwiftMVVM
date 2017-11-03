//
//  BlueViewController.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/2/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BlueViewController: UIViewController {
    
    static let Identifier = "BlueViewController"
    
    var data: String?
    
    lazy var viewModel: BlueViewModel = {
        return BlueViewModel(navigationController: self.navigationController)
    }()
    
    @IBOutlet weak var nextButton: UIButton!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }
    
    func bindView() {
        nextButton.setTitle(data, for: .normal)
        nextButton.rx.tap.subscribe(onNext: {
            [weak self] _ in
            self?.viewModel.next()
        }).disposed(by: disposeBag)
    }

}
