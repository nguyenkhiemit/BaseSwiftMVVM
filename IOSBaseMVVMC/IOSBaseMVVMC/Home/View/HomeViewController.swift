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

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var menuButton: UIImageView!
    
    var viewModel: HomeViewModel?
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
        bindData()
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
    
    func bindData() {
        let arrayBooking: Observable<[Booking]> = viewModel!.loadListBooking(page: 1, pageSize: 10)
        arrayBooking.subscribe {
            print("\($0)")
        }
//        arrayBooking.bindTo(tableView.rx.items(cellIdentifier: HomeTableViewCell.CellIdentifier, cellType: HomeTableViewCell.self)) {
//            row, element, cell in
//            cell.bindData(booking: element)
//        }.disposed(by: disposeBag)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        SwiftEventBus.unregister(self)
    }
    
    func openMenu() {
        self.slideMenuController()?.openLeft()
    }

}
