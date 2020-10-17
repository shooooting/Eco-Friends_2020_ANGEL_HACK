//
//  GuideCollectionViewCell.swift
//  Eco-Friends
//
//  Created by ㅇ오ㅇ on 2020/07/18.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class GuideCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "GuideCollectionViewCell"
  
  let check = UIButton()
  
  let imgV = UIImageView()
  let titleLabel = UILabel()
  
  let singleton = SingletonClass.shared.arrData
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
    setConstraint()
  }
  
  func setUI() {
    contentView.backgroundColor = .systemBackground
    contentView.layer.borderWidth = 1
    contentView.layer.borderColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 0.1)
    contentView.layer.cornerRadius = 10
    [check, imgV, titleLabel].forEach { contentView.addSubview($0) }
    
    titleLabel.font = UIFont(name: "SFProText-Regular", size: 18)
    
    check.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    check.tintColor = .black
    
    imgV.layer.cornerRadius = 10
    
  }
  
  func setConstraint() {
    
    [check, imgV, titleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      
      imgV.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      imgV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      imgV.widthAnchor.constraint(equalToConstant: 80),
      imgV.heightAnchor.constraint(equalToConstant: 80),
      
      titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: imgV.trailingAnchor, constant: 12),
      titleLabel.heightAnchor.constraint(equalToConstant: 18),
      
      check.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 43.21),
      check.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
      check.widthAnchor.constraint(equalToConstant: 8),
      check.heightAnchor.constraint(equalToConstant: 13.5)
    ])
  }
  
}
