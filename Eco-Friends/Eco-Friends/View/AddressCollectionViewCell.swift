//
//  JusoCollectionViewCell.swift
//  juso
//
//  Created by ㅇ오ㅇ on 2020/07/16.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class AddressCollectionViewCell: UICollectionViewCell {
  static let identifier = "JusoCollectionViewCell"
  
  let name = UILabel()
  let xButton = UIButton()
  let jusoTitle = UILabel()
  let oldJuso = UILabel()
  let doroLabel = UILabel()
  let newJuso = UILabel()
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
    setConstraints()
  }
  
  func setUI() {
    contentView.layer.cornerRadius = 10
    contentView.backgroundColor = .white
    [name, xButton, jusoTitle, oldJuso, doroLabel, newJuso].forEach { contentView.addSubview($0) }
    
    name.text = "우리집"
    name.font = .boldSystemFont(ofSize:12)
    
    xButton.setImage(UIImage(systemName: "xmark"), for: .normal)
    xButton.tintColor = .lightGray
    
    jusoTitle.text = "제강빌딩"
    jusoTitle.font = UIFont.systemFont(ofSize: 18)
    
    oldJuso.text = "서울 성동구 성수동2가 289-10 제강빌딩"
    oldJuso.font = UIFont.systemFont(ofSize: 14)
    
    doroLabel.text = "도로명"
    doroLabel.font = UIFont.systemFont(ofSize: 13)
    doroLabel.textAlignment = .center
    doroLabel.tintColor = .gray
    
    doroLabel.layer.borderWidth = 1
    
    newJuso.text = "성수이로 113 제강빌딩"
    newJuso.font = .preferredFont(forTextStyle: .footnote)
  }
  
  func setConstraints() {
    [name, jusoTitle, oldJuso, doroLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
    }
    
    xButton.translatesAutoresizingMaskIntoConstraints = false
    newJuso.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
      name.widthAnchor.constraint(equalToConstant: 41),
      name.heightAnchor.constraint(equalToConstant: 18),
      
      xButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
      xButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
      
      jusoTitle.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 12),
      jusoTitle.widthAnchor.constraint(equalToConstant: 66),
      jusoTitle.heightAnchor.constraint(equalToConstant: 12),
      
      oldJuso.topAnchor.constraint(equalTo: jusoTitle.bottomAnchor, constant: 8),
      oldJuso.widthAnchor.constraint(equalToConstant: 234),
      oldJuso.heightAnchor.constraint(equalToConstant: 17),
      
      doroLabel.topAnchor.constraint(equalTo: oldJuso.bottomAnchor, constant: 4),
      doroLabel.widthAnchor.constraint(equalToConstant: 39),
      doroLabel.heightAnchor.constraint(equalToConstant: 17),
      
      newJuso.topAnchor.constraint(equalTo: oldJuso.bottomAnchor, constant: 4),
      newJuso.leadingAnchor.constraint(equalTo: doroLabel.trailingAnchor, constant: 5),
      newJuso.widthAnchor.constraint(equalToConstant: 130),
      newJuso.heightAnchor.constraint(equalToConstant: 17)
    ])
    
  }
}
