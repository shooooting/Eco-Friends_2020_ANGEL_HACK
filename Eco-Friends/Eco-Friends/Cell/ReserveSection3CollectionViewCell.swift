//
//  ReserveSection3CollectionViewCell.swift
//  Eco-Friends
//
//  Created by Qussk_MAC on 2020/07/17.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ReserveSection3CollectionViewCell: UICollectionViewCell {
    
  let mambershipTitle = UILabel()
  
  required init?(coder: NSCoder) {
     fatalError("init(coder:)")
   }
   
   override init(frame: CGRect) {
     super.init(frame: frame)
     
     setupView()
     setupConstraint()
     
   }
  
  func setupView(){
    
    mambershipTitle.text = "맴버쉽"
    mambershipTitle.font = UIFont.boldSystemFont(ofSize: 15)
    
  }
  
  func setupConstraint(){
    
    [mambershipTitle].forEach{
         $0.translatesAutoresizingMaskIntoConstraints = false
         contentView.addSubview($0)
         $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
         $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16).isActive = true
       }
    
    NSLayoutConstraint.activate([
    mambershipTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
    

    ])
    
    
  }
   
  
  func configure(){
    
  }
  
}
