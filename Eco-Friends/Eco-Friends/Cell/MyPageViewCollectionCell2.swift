//
//  MyPageViewCollectionCell2.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/18.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class MyPageViewCollectionCell2 : UICollectionViewCell {
  //MARK: - Properties
  
  static let identifier = "MyPageViewCollectionCell2"
  private let imageView = UIImageView()
  private let benefitButton = UIButton()
  private let titleLabel = UILabel()
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
    imageView.image = UIImage(named: "Union")
    contentView.addSubview(imageView)
    
    benefitButton.setTitle("등급별 혜택", for: .normal)
    benefitButton.setTitleColor(.lightGray, for: .normal)
    benefitButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
    benefitButton.tintColor = .lightGray
    benefitButton.semanticContentAttribute = .forceRightToLeft
    contentView.addSubview(benefitButton)
    
    titleLabel.text = "새싹이 자라는 중이에요!"
    titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
    titleLabel.textAlignment = .left
    contentView.addSubview(titleLabel)
  }
  
  //MARK: - setConstraint()
  
  private func setConstraint() {
    [imageView, benefitButton, titleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 34),
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
      imageView.widthAnchor.constraint(equalToConstant: 60),
      imageView.heightAnchor.constraint(equalToConstant: 50),
      
      benefitButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
      benefitButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9),
      benefitButton.widthAnchor.constraint(equalToConstant: 110),
      benefitButton.heightAnchor.constraint(equalToConstant: 30),
      
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 95),
      titleLabel.widthAnchor.constraint(equalToConstant: 200),
      titleLabel.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
  
  
}
