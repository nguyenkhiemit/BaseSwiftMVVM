# IOS-BaseSwiftMVVM-C

1)  Use RxSwift bind data to a UITableView : 

_ If tableview have only item type, you use:

      lazy var arrayMenu: Variable<[Menu]> = {
        return self.createData()
      }()
      
      viewModel.arrayMenu.asObservable().bindTo(menuTableView.rx.items(cellIdentifier: MenuTableViewCell.Identifier, cellType: MenuTableViewCell.self)) {
                row, menu, cell in
                cell.setData(menu: menu)
            }.disposed(by: disposeBag)
            
_ If tableview have multiple type, you use:
  
      lazy var arrayMenu: Variable<[Menu]> = {
        return self.createData()
      }()

      viewModel.arrayMenu.asObservable().bindTo(menuTableView.rx.items) {
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
        }.disposed(by: disposeBag)
      }
