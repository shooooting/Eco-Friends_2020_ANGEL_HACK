//
//  ReserveCollectionViewCell.swift
//  Pagetest
//
//  Created by Qussk_MAC on 2020/07/16.
//  Copyright © 2020 Qussk_MAC. All rights reserved.
//

import UIKit

class ReserveSection2CollectionViewCell: UICollectionViewCell {
    
  let requestTitle = UILabel()
  let requestFrom = UILabel()
  let checkButton = UIButton()
  let autoSaveTitle = UILabel()
  let requestTextField = UITextField()
  
  
  required init?(coder: NSCoder) {
     fatalError("init(coder:)")
   }
   
   override init(frame: CGRect) {
     super.init(frame: frame)
     setupView()
     setupConstraint()
   }
  
  
  //MARK:- UI
  func setupView(){
    
    requestTitle.text = "요청사항"
    requestTitle.font = UIFont.boldSystemFont(ofSize: 15)
    
    requestFrom.text = "수거 기사님께"
    requestFrom.font = UIFont.systemFont(ofSize: 14)
    requestFrom.textColor = ColorPiker.customGray
    
   // checkButton.setImage = UIImage(systemName: "checkmark.circle.fill")
    checkButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
    checkButton.tintColor = ColorPiker.customGray
    
    autoSaveTitle.text = "자동저장"
    autoSaveTitle.font = UIFont.systemFont(ofSize: 11)
    
    requestTextField.text = "문앞에 뒀어요"
    requestTextField.borderStyle = .roundedRect
    requestTextField.keyboardType = .emailAddress
    requestTextField.layer.borderColor = ColorPiker.customAlpha.cgColor
    requestTextField.font = UIFont.systemFont(ofSize: 16)
  }
  
  
  //MARK:-Constraint
  func setupConstraint(){
    
    [requestTitle,requestTextField].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
      $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
      $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16).isActive = true
    }
    
    [requestFrom,checkButton,autoSaveTitle].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    
    NSLayoutConstraint.activate([
    
    requestTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),

    requestFrom.topAnchor.constraint(equalTo: requestTitle.bottomAnchor, constant: 10),
    requestFrom.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
    requestFrom.widthAnchor.constraint(lessThanOrEqualToConstant: 88),
    
    checkButton.topAnchor.constraint(equalTo: requestTitle.bottomAnchor, constant: 10),
    checkButton.leadingAnchor.constraint(equalTo: requestFrom.trailingAnchor, constant: 150),
    checkButton.widthAnchor.constraint(lessThanOrEqualToConstant: 16),
    checkButton.heightAnchor.constraint(lessThanOrEqualToConstant: 16),
    checkButton.bottomAnchor.constraint(equalTo: requestTextField.topAnchor, constant: -6),
    
    autoSaveTitle.topAnchor.constraint(equalTo: requestTitle.bottomAnchor, constant: 10),
    autoSaveTitle.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 4),
    autoSaveTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 12),
    autoSaveTitle.bottomAnchor.constraint(equalTo: requestTextField.topAnchor, constant: -5),

    
    requestTextField.topAnchor.constraint(equalTo: requestFrom.bottomAnchor, constant: 8),
    requestTextField.heightAnchor.constraint(equalToConstant: 37),
    requestTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
    ])
    
  }

  
  func configure(){
    
  }
  
}
