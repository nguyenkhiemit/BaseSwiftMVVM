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
import RxDataSources
import SwiftEventBus
import SlideMenuControllerSwift
import ICSPullToRefresh

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var menuButton: UIImageView!
    
    var viewModel: HomeViewModel?
    
    var disposeBag = DisposeBag()
    
    let PAGE_SIZE = 10
    
    var currentPage = 1
    
    var arrayBooking = [Booking]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
        LoadingUtils.show()
        loadData(page: currentPage)
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
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: HomeTableViewCell.CellIdentifier, bundle: nil), forCellReuseIdentifier: HomeTableViewCell.CellIdentifier)
        tableView.rowHeight = 220
        
        tableView.addPullToRefreshHandler {
            self.loadData(page: 1)
        }
        tableView.addInfiniteScrollingWithHandler {
            self.loadData(page: self.currentPage)
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        SwiftEventBus.unregister(self)
    }
    
    func openMenu() {
        self.slideMenuController()?.openLeft()
    }

}

extension HomeViewController {
    //load more with table normal
    //don't use Driver to bind tableview
    fileprivate func loadData(page: Int) {
        viewModel?.loadListData(page: page, pageSize: PAGE_SIZE).subscribe {
            [weak self]
            event in
            switch event {
            case .next(let bookings):
                self?.currentPage += 1
                self?.arrayBooking.append(contentsOf: bookings)
                self?.tableView.reloadData()
            case .error(let error):
                print("\(error)")
            case .completed:
                print("Complete!")
            }
            if(self?.tableView?.showsPullToRefresh)! {
                self?.tableView.pullToRefreshView?.stopAnimating()
            }
            if(self?.tableView.showsInfiniteScrolling)! {
                self?.tableView.infiniteScrollingView?.stopAnimating()
            }
            LoadingUtils.close()
        }
    }
        
    //can't load more with drive
    //error Maybe delegate was already set in `xib` or `storyboard` and now it's being overwritten in code.
    fileprivate func bindData(page: Int) {
        viewModel?.loadListBooking(page: page, pageSize: PAGE_SIZE)
        .map {
            [weak self]
            result -> [Booking] in
            if(self?.tableView?.showsPullToRefresh)! {
                self?.tableView.pullToRefreshView?.stopAnimating()
            }
            if(self?.tableView.showsInfiniteScrolling)! {
                self?.tableView.infiniteScrollingView?.stopAnimating()
            }
            switch result {
            case .success(let bookings):
                self?.currentPage += 1
                self?.arrayBooking.append(contentsOf: bookings)
                return (self?.arrayBooking)!
            case .failure(let error):
                print(error.localizedDescription)
                return []
            }
        }
        .drive(tableView.rx.items(cellIdentifier: HomeTableViewCell.CellIdentifier, cellType: HomeTableViewCell.self)) {
            row, booking, cell in
            cell.bindData(booking: booking)
        }
        .addDisposableTo(disposeBag)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayBooking.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let booking = arrayBooking[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.CellIdentifier, for: indexPath)
        as! HomeTableViewCell
        cell.bindData(booking: booking)
        return cell
    }
}
