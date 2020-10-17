//
//  ReserveCompleteChildTableViewCell.swift
//  Eco-Friends
//
//  Created by ㅇ오ㅇ on 2020/07/17.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ReserveCompleteChildTableViewCell: UITableViewCell {
  
  static let identifier = "ReserveCompleteChildTableViewCell"
  
  let date = UILabel()
  let nowDate = UILabel()
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstraint()
  }
  
  func setUI() {
    [date, nowDate].forEach { contentView.addSubview($0) }

    date.text = "날짜"
    date.font = .systemFont(ofSize: 15)

    nowDate.text = "2020. 07. 17 금"
    nowDate.font = .boldSystemFont(ofSize: 20)
  }

  func setConstraint() {
    [date, nowDate].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false

      $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
    }

    NSLayoutConstraint.activate([
      date.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      date.widthAnchor.constraint(equalToConstant: 28),
      date.heightAnchor.constraint(equalToConstant: 18),

      nowDate.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 12),
      nowDate.widthAnchor.constraint(equalToConstant: 148),
      nowDate.heightAnchor.constraint(equalToConstant: 24)
    ])
  }
  
  func configure() {
    
//    date.text =
//    nowDate.text =
  }
}
