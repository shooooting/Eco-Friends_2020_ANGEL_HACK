//
//  ReserveCollectionViewCell.swift
//  Pagetest
//
//  Created by Qussk_MAC on 2020/07/16.
//  Copyright © 2020 Qussk_MAC. All rights reserved.
//

import UIKit

class ReserveSection1CollectionViewCell: UICollectionViewCell {
  
  //수거정보
  let reportTitle = UILabel()
  let addressTitle = UILabel()
  let editButton = UIButton()
  
  //주소
  let addressRegion = UILabel()
  let addressLoadName = UILabel()
  let addressLoadlable = UILabel()
  let lineView = UIView()
  
  //현관정보
  let doorTitle = UILabel()
  let doorNumberButton = UIButton()
  
  let setBule1 = UIImageView()
  let doorTextField = UITextField()
  
  let noNumberButton = UIButton()
  let setBule2 = UIImageView()
  let noNumberLable = UILabel()
  let line2View = UIView()
  
  //연락처
  let phonTitle = UILabel()
  let phonNumber = UILabel()
  
  var isClicked : Bool = false
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:)")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupView()
    setupConstraint()
    checkColor()

  }
  
  @objc func checkColor () {
    if isClicked == false {
      setBule1.alpha = 1
      isClicked = true
    } else {
      setBule2.alpha = 0
      isClicked = false
    }
  }
  
  @objc func checkColor2 () {
    if isClicked == false {
      setBule1.alpha = 1
      isClicked = true
    } else {
      setBule2.alpha = 0
      isClicked = false
    }
  }

  
  //MARK:- UI
  
  func setupView(){
      
    //MARK:- 1-1.
    reportTitle.text = "수거정보"
    reportTitle.font = UIFont.systemFont(ofSize: 15)
    
    addressTitle.text = "제강빌딩"
    addressTitle.font = UIFont.boldSystemFont(ofSize: 20)
    
    editButton.setTitle("변경", for: .normal)
    editButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    editButton.backgroundColor = ColorPiker.customGray
    editButton.layer.cornerRadius = 10
    contentView.addSubview(editButton)
    
    addressRegion.text = "서울 성동구 성수동2가 289-10 제강빌딩"
    addressRegion.font = UIFont.systemFont(ofSize: 14)
    addressRegion.textColor = ColorPiker.customGray
    
    addressLoadName.text = "도로명"
    addressLoadName.textAlignment = .center
    addressLoadName.font = UIFont.systemFont(ofSize: 11)
    addressLoadName.layer.borderWidth = 1
    addressLoadName.layer.borderColor = ColorPiker.customGray.cgColor
    addressLoadName.textColor = ColorPiker.customGray
    
    addressLoadlable.text = "성수이로 113 제강빌딩"
    addressLoadlable.font = UIFont.systemFont(ofSize: 14)
    addressLoadlable.textColor = ColorPiker.customGray
    
    lineView.backgroundColor = ColorPiker.customAlpha
    
    
    //MARK:- 1-2.
    doorTitle.text = "공동현관 출입정보"
    doorTitle.font = UIFont.boldSystemFont(ofSize: 15)
    
    doorNumberButton.setImage(UIImage(systemName: "circle"), for: .normal)
    doorNumberButton.tintColor = ColorPiker.customAlpha
    doorNumberButton.addTarget(self, action: #selector(checkColor), for: .touchUpInside)
    
    setBule1.image = UIImage(systemName: "circle.fill")
    setBule1.tintColor = ColorPiker.customBlue
    
    doorTextField.borderStyle = .roundedRect
    doorTextField.layer.borderColor = ColorPiker.customAlpha.cgColor
    doorTextField.font = UIFont.systemFont(ofSize: 15)
    doorTextField.placeholder = "#1234"
    
    noNumberButton.setImage(UIImage(systemName: "circle"), for: .normal)
    noNumberButton.addTarget(self, action: #selector(checkColor2), for: .touchUpInside)
    noNumberButton.tintColor = ColorPiker.customAlpha
  
    setBule2.image = UIImage(systemName: "circle.fill")
    setBule2.tintColor = ColorPiker.customBlue
    
    noNumberLable.font = UIFont(name: "PingFangSC-Light", size: 15)
    noNumberLable.text = "비밀번호 없이 출입가능"
    
    line2View.backgroundColor = ColorPiker.customAlpha

    //MARK:- 1-3.
    phonTitle.text = "연락처"
    phonTitle.font = UIFont.boldSystemFont(ofSize: 15)
    
    phonNumber.text = "010-3409-0000"
    phonNumber.font = UIFont.systemFont(ofSize: 15)
    
  }
  
  
  //MARK:- Constraint
  func setupConstraint(){
    
    [reportTitle,addressTitle,addressRegion,lineView,doorTitle,line2View,phonTitle,phonNumber].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
      $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
      $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16).isActive = true
    }
    
    [addressLoadName,addressLoadlable,editButton,doorNumberButton,setBule1,doorTextField,noNumberButton,setBule2,noNumberLable].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
    //MARK:- 2-1.
      
      reportTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
      
      addressTitle.topAnchor.constraint(equalTo: reportTitle.bottomAnchor, constant: 12),
      
      editButton.topAnchor.constraint(equalTo: reportTitle.bottomAnchor, constant: 12),
      editButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      editButton.widthAnchor.constraint(equalToConstant: 40),
      editButton.heightAnchor.constraint(equalToConstant: 20),
      
      addressRegion.topAnchor.constraint(equalTo: addressTitle.bottomAnchor, constant: 8),
      
      addressLoadName.topAnchor.constraint(equalTo: addressRegion.bottomAnchor, constant: 4),
      addressLoadName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      addressLoadName.trailingAnchor.constraint(equalTo: addressLoadlable.leadingAnchor, constant: -5),
      addressLoadName.widthAnchor.constraint(equalToConstant: 39),
      addressLoadName.heightAnchor.constraint(equalToConstant: 17),
      
      addressLoadlable.topAnchor.constraint(equalTo: addressRegion.bottomAnchor, constant: 4),
      addressLoadlable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
      
      lineView.topAnchor.constraint(equalTo: addressLoadName.bottomAnchor, constant: 12),
      lineView.heightAnchor.constraint(equalToConstant: 0.2),
  
 
      //MARK:- 2-2.
      doorTitle.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 11),
      doorTitle.heightAnchor.constraint(equalToConstant: 18),

      doorNumberButton.topAnchor.constraint(equalTo: doorTitle.bottomAnchor, constant: 22),
      doorNumberButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      doorNumberButton.widthAnchor.constraint(equalToConstant: 18),
      doorNumberButton.heightAnchor.constraint(equalToConstant: 18),
      
      setBule1.centerXAnchor.constraint(equalTo: doorNumberButton.centerXAnchor),
      setBule1.centerYAnchor.constraint(equalTo: doorNumberButton.centerYAnchor),
      setBule1.widthAnchor.constraint(equalToConstant: 9),
      setBule1.heightAnchor.constraint(equalToConstant: 9),
      
      doorTextField.topAnchor.constraint(equalTo: doorTitle.bottomAnchor, constant: 12),
      doorTextField.leadingAnchor.constraint(equalTo: doorNumberButton.trailingAnchor, constant: 12),
      doorTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      doorTextField.heightAnchor.constraint(equalToConstant: 40),
      
      noNumberButton.topAnchor.constraint(equalTo: doorNumberButton.bottomAnchor, constant: 25),
      noNumberButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      noNumberButton.widthAnchor.constraint(equalToConstant: 18),
      noNumberButton.heightAnchor.constraint(equalToConstant: 18),
      
      setBule2.centerXAnchor.constraint(equalTo: noNumberButton.centerXAnchor),
      setBule2.centerYAnchor.constraint(equalTo: noNumberButton.centerYAnchor),
      setBule2.widthAnchor.constraint(equalToConstant: 9),
      setBule2.heightAnchor.constraint(equalToConstant: 9),
      
      noNumberLable.topAnchor.constraint(equalTo: doorTextField.bottomAnchor, constant: 14),
      noNumberLable.leadingAnchor.constraint(equalTo: noNumberButton.trailingAnchor, constant: 12),
      noNumberLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      noNumberLable.heightAnchor.constraint(equalToConstant: 18),
          
      line2View.topAnchor.constraint(equalTo: noNumberLable.bottomAnchor, constant: 15),
      line2View.heightAnchor.constraint(equalToConstant: 0.2),
      
      
      //MARK:- 2-3.
      phonTitle.topAnchor.constraint(equalTo: line2View.bottomAnchor, constant: 11),
      
      phonNumber.topAnchor.constraint(equalTo: phonTitle.bottomAnchor, constant: 11),
      phonNumber.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14)
      
    ])
    
    
  }
  
  
  func configure(){
    
  }
}
