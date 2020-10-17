//
//  MyPageViewCollectionCell.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/18.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

protocol MyPageViewCollectionCell3Delegate {
  func handlePresent()
}

class MyPageViewCollectionCell3 : UICollectionViewCell {
  //MARK: - Properties
  var delegate: MyPageViewCollectionCell3Delegate?
  
  static let identifier = "MyPageViewCollectionViewCell3"
  private let tableView = UITableView()
  var menuData = ["주문목록", "이벤트", "공지사항", "고객센터", "환경설정"]
  
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
  
    setUI()
    setConstraint()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - setUI()
  
  private func setUI(){
    tableView.rowHeight = 50
    tableView.allowsSelection = false
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(TableViewCellInCollectionView3.self, forCellReuseIdentifier: TableViewCellInCollectionView3.identifier)
    contentView.addSubview(tableView)
  }
  
  //MARK: - setConstraint()
  
  private func setConstraint() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
}

//MARK: - extension : UITableViewDataSource

extension MyPageViewCollectionCell3 : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    menuData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellInCollectionView3.identifier, for: indexPath) as! TableViewCellInCollectionView3
    cell.delegate = self
    cell.configure(data: menuData[indexPath.row])
    return cell
  }
}

extension MyPageViewCollectionCell3 : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let orderListVC = OrderListPageView()
    orderListVC.modalPresentationStyle = .fullScreen
    
  }
}


extension MyPageViewCollectionCell3: TableViewCellInCollectionView3Delegate {
  func handlePresent() {
    delegate?.handlePresent()
  }
  
  
}
