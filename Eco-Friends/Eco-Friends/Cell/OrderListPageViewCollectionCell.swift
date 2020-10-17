//
//  OrderListViewCollectionCell.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/18.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class OrderListPageViewCollectionCell : UICollectionViewCell {
  //MARK: - Properties
  static let identifier = "OrderListPageViewCollectionCell"
  private let numberLabel = UILabel()
  private let nextButton = UIButton()
  let statusLabel = UILabel()
  private let dateLabel = UILabel()
  private let timeLabel = UILabel()
  
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
  private func setUI() {
    numberLabel.text = ""
    numberLabel.textAlignment = .left
    numberLabel.textColor = .black
    numberLabel.font = UIFont.boldSystemFont(ofSize: 14)
    contentView.addSubview(numberLabel)
    
    nextButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    nextButton.tintColor = .lightGray
    contentView.addSubview(nextButton)
    
    statusLabel.text = ""
    statusLabel.textAlignment = .left
    statusLabel.textColor = UIColor.black.withAlphaComponent(0.5)
    statusLabel.font = UIFont.boldSystemFont(ofSize: 12)
    contentView.addSubview(statusLabel)
    
    dateLabel.text = ""
    dateLabel.textAlignment = .left
    dateLabel.textColor = .lightGray
    dateLabel.font = UIFont.boldSystemFont(ofSize: 12)
    contentView.addSubview(dateLabel)
    
    timeLabel.text = "오전 00:00 ~ 오전 07:00"
    timeLabel.textAlignment = .left
    timeLabel.textColor = .lightGray
    timeLabel.font = UIFont.boldSystemFont(ofSize: 12)
    contentView.addSubview(timeLabel)
  }
  
  //MARK: - setConstraint()
  private func setConstraint() {
    [numberLabel, nextButton, statusLabel, dateLabel, timeLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      numberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      numberLabel.widthAnchor.constraint(equalToConstant: 111),
      numberLabel.heightAnchor.constraint(equalToConstant: 20),
      
      nextButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
      nextButton.widthAnchor.constraint(equalToConstant: 8),
      nextButton.heightAnchor.constraint(equalToConstant: 13),
      
      statusLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 24),
      statusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      statusLabel.widthAnchor.constraint(equalToConstant: 55),
      statusLabel.heightAnchor.constraint(equalToConstant: 18),
      
      dateLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor , constant: 12),
      dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      dateLabel.widthAnchor.constraint(equalToConstant: 80),
      dateLabel.heightAnchor.constraint(equalToConstant: 20),
      
      timeLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 12),
      timeLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
      timeLabel.widthAnchor.constraint(equalToConstant: 200),
      timeLabel.heightAnchor.constraint(equalToConstant: 20),
    ])
  }
  
  func configure(number : String ,status : String, date : String ) {
    numberLabel.text = number
    statusLabel.text = status
    dateLabel.text = date 
  }
}
