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
        self.viewModel = MenuViewModel()
        configureTableView()
        initData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func configureTableView() {
        registerCell()
        tableView.rowHeight = 30
    }
    
    private func registerCell() {
        let nib = UINib(nibName: String(describing:MenuViewCell.Identifier), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing:MenuViewCell.Identifier))
    }
    
    func initData() {
        viewModel?.arrayMenu.drive(tableView.rx.items(cellIdentifier:  String(describing: MenuViewCell.Identifier), cellType: MenuViewCell.self)) {
            row, menu, cell in
            print("menu = \(menu)")
            cell.setData(menu: menu)
        }.disposed(by: disposeBag)
    }
    
}
