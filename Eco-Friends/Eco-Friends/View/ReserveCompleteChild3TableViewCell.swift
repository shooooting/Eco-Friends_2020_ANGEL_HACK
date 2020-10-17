//
//  ReserveCompleteChild3TableViewCell.swift
//  Eco-Friends
//
//  Created by ㅇ오ㅇ on 2020/07/17.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ReserveCompleteChild3TableViewCell: UITableViewCell {
  
  static let identifier = "ReserveCompleteChild3TableViewCell"
  
  let itemLabel = UILabel()
  let priceLabel = UILabel()
  
  let selectItemLabel = UILabel()
  let priceSelectLabel = UILabel()
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setUI()
    setConstraint()
  }
  
  func setUI() {
    [itemLabel, priceLabel, selectItemLabel, priceSelectLabel].forEach { contentView.addSubview($0) }
    
    itemLabel.text = "종류"
    itemLabel.font = UIFont.boldSystemFont(ofSize: 15)
    
    priceLabel.text = "금액"
    priceLabel.font = UIFont.boldSystemFont(ofSize: 15)
    
    selectItemLabel.text = "일반"
    selectItemLabel.font = UIFont.boldSystemFont(ofSize: 20)
    priceSelectLabel.text = "3,000원"
    priceSelectLabel.font = UIFont.boldSystemFont(ofSize: 20)
    
  }
  
  func setConstraint() {
    [itemLabel, priceLabel, selectItemLabel, priceSelectLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    NSLayoutConstraint.activate([
      itemLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
      itemLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      itemLabel.widthAnchor.constraint(equalToConstant: 28),
      itemLabel.heightAnchor.constraint(equalToConstant: 18),
      
      priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
      priceLabel.leadingAnchor.constraint(equalTo: itemLabel.trailingAnchor, constant: 118),
      priceLabel.widthAnchor.constraint(equalToConstant: 28),
      priceLabel.heightAnchor.constraint(equalToConstant: 18),
      
      selectItemLabel.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: 12),
      selectItemLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      selectItemLabel.widthAnchor.constraint(equalToConstant: 37),
      selectItemLabel.heightAnchor.constraint(equalToConstant: 24),
      
      priceSelectLabel.topAnchor.constraint(equalTo: selectItemLabel.topAnchor),
      priceSelectLabel.leadingAnchor.constraint(equalTo: selectItemLabel.trailingAnchor, constant: 109),
      priceSelectLabel.widthAnchor.constraint(equalToConstant: 77),
      priceSelectLabel.heightAnchor.constraint(equalToConstant: 24)
    ])
  }
  
  
}
