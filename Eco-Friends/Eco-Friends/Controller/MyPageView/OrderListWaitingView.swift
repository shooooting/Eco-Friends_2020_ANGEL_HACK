//
//  OrderListWaitingView.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/19.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class OrderListWaitingView : UIViewController {
  // MARK:- Properties
  let imgV = UIImageView()
  let text = UILabel()
//  let xButton = UIButton()
  let childViewController = ReserveCompleteChildViewController()
//  let completeButton = UIButton()
  // MARK:- ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = ColorPiker.customBackground
    setNavi()
    setUI()
    setConstraint()
  }
  
  //MARK: - setNavi()
  
  func setNavi() {
    self.navigationItem.title = "주문목록"
  }
  
  // MARK:- setUI
  func setUI() {
    
    addChild(childViewController)
    view.addSubview(childViewController.view)
    childViewController.didMove(toParent: self)
    
    view.backgroundColor = .lightGray
    [imgV, text].forEach { view.addSubview($0) }
    
    imgV.image = UIImage(named: "842411_interface_512x512 1")
    imgV.tintColor = .systemBlue
    imgV.layer.borderWidth = 0
    imgV.layer.cornerRadius = 50
    
    text.text = "수거 대기 중!"
    text.textAlignment = .center
    text.font = .boldSystemFont(ofSize: 15)
    
//    xButton.setImage(UIImage(systemName: "xmark"), for: .normal)
//    xButton.tintColor = .black
    
//    completeButton.setTitle("확인", for: .normal)
//    completeButton.backgroundColor = .systemBlue
//    completeButton.layer.cornerRadius = 23
    
  }
  // MARK:- setConstraint
  func setConstraint() {
    let guide = view.safeAreaLayoutGuide
    [imgV, text, childViewController.view].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      imgV.topAnchor.constraint(equalTo: guide.topAnchor, constant: 88),
      imgV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imgV.widthAnchor.constraint(equalToConstant: 100),
      imgV.heightAnchor.constraint(equalToConstant: 100),
      
      text.topAnchor.constraint(equalTo: imgV.bottomAnchor, constant: 24),
      text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      text.widthAnchor.constraint(equalToConstant: 80),
      text.heightAnchor.constraint(equalToConstant: 22),
      
//      xButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 59),
//      xButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
//      xButton.widthAnchor.constraint(equalToConstant: 14),
//      xButton.heightAnchor.constraint(equalToConstant: 14),
      
      childViewController.view.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 59),
      childViewController.view.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 18),
      childViewController.view.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -18),
      childViewController.view.widthAnchor.constraint(equalToConstant: 339),
      childViewController.view.heightAnchor.constraint(equalToConstant: 304),
      
//      completeButton.topAnchor.constraint(equalTo: childViewController.view.bottomAnchor, constant: 93.23),
//      completeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 62),
//      completeButton.widthAnchor.constraint(equalToConstant: 251),
//      completeButton.heightAnchor.constraint(equalToConstant: 44)
    ])
  }
}
