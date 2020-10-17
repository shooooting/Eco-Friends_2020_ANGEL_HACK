//
//  TableViewCellInCollectionView3.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/18.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

protocol TableViewCellInCollectionView3Delegate: class {
  func handlePresent()
}

class TableViewCellInCollectionView3 : UITableViewCell {
  
  //MARK: - Properties
  
  var delegate: TableViewCellInCollectionView3Delegate?
  
  static let identifier = "TableViewCellInCollectionView3"
  private let menuLabel = UILabel()
  private let nextButton = UIButton()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstraint()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUI() {
    menuLabel.font = UIFont(name: "PingFangHK-Light", size: 15)
    menuLabel.textAlignment = .left
    menuLabel.textColor = .black
    menuLabel.backgroundColor = .white
    contentView.addSubview(menuLabel)
    
    nextButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    nextButton.tintColor = .lightGray
    nextButton.addTarget(self, action: #selector(moveToOrderList), for: .touchUpInside)
    contentView.addSubview(nextButton)
  }
  
  private func setConstraint() {
    [menuLabel, nextButton].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    NSLayoutConstraint.activate([
      menuLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      menuLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      menuLabel.widthAnchor.constraint(equalToConstant: 80),
      menuLabel.heightAnchor.constraint(equalToConstant: 22),
      
      nextButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      nextButton.widthAnchor.constraint(equalToConstant: 8),
      nextButton.heightAnchor.constraint(equalToConstant: 13)
    ])
  }
  
  func configure(data : String) {
    menuLabel.text = data
  }
  
  @objc func moveToOrderList() {
    delegate?.handlePresent()  }
}
