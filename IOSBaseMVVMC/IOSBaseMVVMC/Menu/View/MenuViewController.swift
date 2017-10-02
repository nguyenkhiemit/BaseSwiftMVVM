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
import SlideMenuControllerSwift
 
class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    let disposeBag = DisposeBag()

    var viewModel: MenuViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        initData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func configureTableView() {
        let nib = UINib(nibName: MenuTableViewCell.Identifier, bundle: nil)
        menuTableView.register(nib, forCellReuseIdentifier: MenuTableViewCell.Identifier)
        
        let titleNib = UINib(nibName: TitleMenuTableViewCell.Identifier, bundle: nil)
        menuTableView.register(titleNib, forCellReuseIdentifier: TitleMenuTableViewCell.Identifier)
    }
    
    func initData() {
        viewModel!.arrayMenu.asObservable().bindTo(menuTableView.rx.items) {
                (tableView, row, element) in
                let indexPath = IndexPath(row: row, section: 0)
            
            if(MenuType.TITLE == element.type) {
                self.menuTableView.rowHeight = 30
                let cell = self.menuTableView.dequeueReusableCell(withIdentifier: TitleMenuTableViewCell.Identifier, for: indexPath) as! TitleMenuTableViewCell
                cell.setData(menu: element)
                return cell
            } else {
                self.menuTableView.rowHeight = 44
                let cell = self.menuTableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.Identifier, for: indexPath) as! MenuTableViewCell
                cell.setData(menu: element)
                return cell
            }
        }.addDisposableTo(disposeBag)
        
        menuTableView.rx.modelSelected(Menu.self)
            .bindTo(viewModel!.newScreenSubject)
            .addDisposableTo(disposeBag)
    }
    
}
