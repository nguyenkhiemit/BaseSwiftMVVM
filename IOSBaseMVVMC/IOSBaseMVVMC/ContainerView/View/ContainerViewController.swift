//
//  ContainerViewController.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/2/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ContainerViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIImageView!
    
    @IBOutlet weak var blueButton: UIButton!
    
    @IBOutlet weak var orangeButton: UIButton!
    
    @IBOutlet weak var greenButton: UIButton!
    
    @IBOutlet weak var blueContainerView: UIView!
    
    @IBOutlet weak var orangeContainerView: UIView!
    
    @IBOutlet weak var greenContainerView: UIView!
    
    var viewModel: ContainerViewModel?
    
    let disposeBag = DisposeBag()
    
    static let Identifier = "ContainerViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }
    
    func bindView() {
        backButton.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(back))
        backButton.addGestureRecognizer(tapRecognizer)
        
        blueButton.rx.tap.subscribe(onNext: {
            [weak self] _ in
            self?.blueContainerView.isHidden = false
            self?.orangeContainerView.isHidden = true
            self?.greenContainerView.isHidden = true
        }).disposed(by: disposeBag)
        
        orangeButton.rx.tap.subscribe(onNext: {
            [weak self] _ in
            self?.blueContainerView.isHidden = true
            self?.orangeContainerView.isHidden = false
            self?.greenContainerView.isHidden = true
        }).disposed(by: disposeBag)
        
        greenButton.rx.tap.subscribe(onNext: {
            [weak self] _ in
            self?.blueContainerView.isHidden = true
            self?.orangeContainerView.isHidden = true
            self?.greenContainerView.isHidden = false
        }).disposed(by: disposeBag)
    }
    
    func back() {
        viewModel?.back()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == BlueViewController.Identifier) {
            let controller = segue.destination as! BlueViewController
            controller.data = "BLUE BUTTON"
        }
    }
}
