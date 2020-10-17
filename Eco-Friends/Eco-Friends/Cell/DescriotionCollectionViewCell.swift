//
//  DescriotionCollectionViewCell.swift
//  Eco-Friends
//
//  Created by Qussk_MAC on 2020/07/18.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class DescriotionCollectionViewCell: UICollectionViewCell {
  
  let identifier = "DescriotionCollectionViewCell"
  
  let descriptionImage = UIImageView()
  let descriptionLabel = UILabel()
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:)")
    
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    constraint()
  }

  
  func setupView(){
    
    layer.masksToBounds = true
    descriptionImage.image = UIImage(named: "dc1")
    descriptionImage.layer.cornerRadius = contentView.frame.width/17
    contentView.addSubview(descriptionImage)
    
  }
  

  func constraint(){
    
    descriptionImage.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
    
      descriptionImage.topAnchor.constraint(equalTo: contentView.topAnchor),
      descriptionImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      descriptionImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      descriptionImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
    
  
}

}
