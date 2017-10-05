//
//  ViewExtension.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/4/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

extension UIView {
    
    typealias TapHandler = (() -> (Void))
    
    func tap(handler: @escaping TapHandler) {
        let disposeBag = DisposeBag()
        let tapView = UITapGestureRecognizer()
        tapView.rx.event
            .subscribe({
                _ in
                print("CLICK TAP !!!")
                handler()
            })
        .disposed(by: disposeBag)
        self.addGestureRecognizer(tapView)
    }
}
