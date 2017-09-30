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

class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    let disposeBag = DisposeBag()
    
    lazy var viewModel: MenuViewModel = {
       return MenuViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        initData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func configureTableView() {
        registerCell()
        menuTableView.rowHeight = 50
    }
    
    private func registerCell() {
        let nib = UINib(nibName: String(describing: MenuTableViewCell.self), bundle: nil)
        menuTableView.register(nib, forCellReuseIdentifier: String(describing: MenuTableViewCell.self))
    }
    
    func initData() {
//        viewModel.arrayMenu.drive(menuTableView.rx.items(cellIdentifier:  String(describing: MenuViewCell.self), cellType: MenuViewCell.self)) {
//            row, menu, cell in
//            print("===> 2")
//            cell.setData(menu: menu)
//        }.disposed(by: disposeBag)
        viewModel.arrayMenu.asObservable().bindTo(menuTableView.rx.items(cellIdentifier: MenuTableViewCell.Identifier, cellType: MenuTableViewCell.self)) {
            row, menu, cell in
            cell.setData(menu: menu)
        }.disposed(by: disposeBag)
    }
    
}
