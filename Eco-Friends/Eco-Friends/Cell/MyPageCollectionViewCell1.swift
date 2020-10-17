//
//  MyPageCollectionViewCell1.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/17.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class  MyPageCollectionViewCell1 : UICollectionViewCell {
  static let identifier = " MyPageCollectionViewCell1"
  
  private let nameLabel = UILabel()
  private let textLabel = UILabel()
  private let imageView = UIImageView()
  private let nextButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
      
    setUI()
    setConstraint()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    
  }
  
  private func setUI() {
    nameLabel.text = "변윤나님"
    nameLabel.textColor = .black
    nameLabel.textAlignment = .left
    nameLabel.font = UIFont.boldSystemFont(ofSize: 26)
    contentView.addSubview(nameLabel)
    
    imageView.image = UIImage(named: "Union")
    contentView.addSubview(imageView)
    
    textLabel.text = "새싹이 자라는 중이에요!"
    textLabel.textColor = UIColor.black
    textLabel.textAlignment = .left
    textLabel.font = UIFont(name: "PingFangHK-Light", size: 15)
    contentView.addSubview(textLabel)
    
    nextButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    nextButton.tintColor = .lightGray
    contentView.addSubview(nextButton)
    
  }
  
  private func setConstraint() {
    [nameLabel, nextButton, imageView, textLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      nameLabel.widthAnchor.constraint(equalToConstant: 130),
      nameLabel.heightAnchor.constraint(equalToConstant: 40),
      
      nextButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
      nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      nextButton.widthAnchor.constraint(equalToConstant: 15),
      nextButton.heightAnchor.constraint(equalToConstant: 20),
      
      imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7),
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      imageView.widthAnchor.constraint(equalToConstant: 25),
      imageView.heightAnchor.constraint(equalToConstant: 25),
      
      textLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
      textLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
      textLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width),
      textLabel.heightAnchor.constraint(equalToConstant: 25)
    ])
  }
  
}
