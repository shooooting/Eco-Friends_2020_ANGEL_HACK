//
//  SelectDataViewCollectionCell.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/19.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class SelectDataViewCollectionCell : UICollectionViewCell {
  //MARK: - Properties
  static let identifier = "SelectDataViewCollectionCell"
  
  var dayLabel = UILabel()
  var dateLabel = UILabel()
  
  //MARK: - init
  override init(frame:CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraint()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  //MARK: - setUI()
  
  private func setUI() {
    dayLabel.text = ""
    dayLabel.textAlignment = .center
    dayLabel.textColor = .black
    dayLabel.font = UIFont.boldSystemFont(ofSize: 22)
    contentView.addSubview(dayLabel)
    
    dateLabel.text = ""
    dateLabel.textAlignment = .center
    dateLabel.textColor = .black
    dateLabel.font = UIFont.boldSystemFont(ofSize: 18)
    contentView.addSubview(dateLabel)
  }
  
  //MARK: - setConstraint()
  
  private func setConstraint() {
    [dayLabel, dateLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 34),
      dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17.5),
      dayLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17.5),
      dayLabel.heightAnchor.constraint(equalToConstant: 22),
      
      dateLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 16),
      dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 29),
      dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -29),
      dateLabel.heightAnchor.constraint(equalToConstant: 18)
      
    ])
  }
  
  func configure(day : String, date :String) {
    dayLabel.text = day
    dateLabel.text = date
  }
  
}
