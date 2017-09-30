//
//  MenuViewController.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 9/29/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MenuViewController: BaseViewController<MenuViewModel> {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initData() {
        viewModel.arrayMenu.drive(tableView.rx.items(cellIdentifier:  String(describing: MenuViewCell.self), cellType: MenuViewCell.self)) {
            row, menu, cell in
            cell.setData(menu: menu)
        }.disposed(by: disposeBag)
    }
    
}
