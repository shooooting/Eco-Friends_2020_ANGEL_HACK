//
//  ReserveCompleteChild2TableViewCell.swift
//  Eco-Friends
//
//  Created by ㅇ오ㅇ on 2020/07/17.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ReserveCompleteChild2TableViewCell: UITableViewCell {
  
  static let identifier = "ReserveCompleteChild2TableViewCell"
  
  let jusoLabel = UILabel()
  let selectName = UILabel()
  let oldAddress = UILabel()
  let newJusoLabel = UILabel()
  let newAddress = UILabel()
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstraint()
  }
  
  func setUI() {
    [jusoLabel, selectName, oldAddress, newAddress, newJusoLabel].forEach { contentView.addSubview($0) }
    
    jusoLabel.text = "주소"
    jusoLabel.font = UIFont.systemFont(ofSize: 15)
    
    selectName.text = "제강빌딩"
    selectName.font = UIFont.boldSystemFont(ofSize: 20)
    
    oldAddress.text = "서울 성동구 성수동2가 289-10 제강빌딩"
    oldAddress.font = UIFont.systemFont(ofSize: 14)
    
    newJusoLabel.text = "도로명"
    newJusoLabel.font = UIFont.systemFont(ofSize: 13)
    newJusoLabel.textAlignment = .center
    newJusoLabel.tintColor = .gray
    newJusoLabel.layer.borderWidth = 1
    
    newAddress.text = "성수이로 113 제강빌딩"
    newAddress.font = .preferredFont(forTextStyle: .footnote)
  }
  
  func setConstraint() {
    [jusoLabel, selectName, oldAddress, newJusoLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
    }
    
    newAddress.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      jusoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
      jusoLabel.widthAnchor.constraint(equalToConstant: 28),
      jusoLabel.heightAnchor.constraint(equalToConstant: 18),
      
      selectName.topAnchor.constraint(equalTo: jusoLabel.bottomAnchor, constant: 8),
      selectName.widthAnchor.constraint(equalToConstant: 73),
      selectName.heightAnchor.constraint(equalToConstant: 24),
      
      oldAddress.topAnchor.constraint(equalTo: selectName.bottomAnchor, constant: 8),
      oldAddress.widthAnchor.constraint(equalToConstant: 234),
      oldAddress.heightAnchor.constraint(equalToConstant: 17),
      
      newJusoLabel.topAnchor.constraint(equalTo: oldAddress.bottomAnchor, constant: 4),
      newJusoLabel.widthAnchor.constraint(equalToConstant: 39),
      newJusoLabel.heightAnchor.constraint(equalToConstant: 17),
      
      newAddress.topAnchor.constraint(equalTo: oldAddress.bottomAnchor, constant: 4),
      newAddress.leadingAnchor.constraint(equalTo: newJusoLabel.trailingAnchor, constant: 5),
      newAddress.widthAnchor.constraint(equalToConstant: 130),
      newAddress.heightAnchor.constraint(equalToConstant: 17)
    ])
  }
}
