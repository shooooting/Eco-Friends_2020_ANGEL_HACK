//
//  OrderViewController.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/15.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
// 배고파

import UIKit

class OrderViewController: UIViewController {
  //MARK: - Properties
  let text = UITextField()
  var loginCheck = false
  private let textLabel = UILabel()
  private let addressButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("성동구 성수이로 108", for: .normal)
    bt.setTitleColor(.black, for: .normal)
    bt.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    bt.tintColor = .black
    bt.sizeToFit()
    bt.semanticContentAttribute = .forceRightToLeft
    return bt
  }()
  
  private let loginButton = UIButton()
  
  private let dateButton = UIButton()
  private let imageView = UIImageView()
  private let divider1 = DividerView()
  private var popUpView = PopUpLoginView()
  private let cancelButton = UIButton()
  private var floatingCenterYConstraint : NSLayoutConstraint!
  private let reserveButton = UIButton()
  //  let homeVC = HomeViewController()
  //  let hidingView = UIView()
  
  //MARK: - viewDidLoad()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    view.clipsToBounds = true
    view.layer.cornerRadius = 20
    view.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
    
    
    
    popUpView.clipsToBounds = true
    popUpView.layer.cornerRadius = 20
    popUpView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner,.layerMaxXMinYCorner)
    
    
    
    setUI()
    setConstraint()
  }
  
  //MARK: - setUI()
  private func setUI() {
    view.addSubview(addressButton)
    view.addSubview(divider1)
    
    addressButton.addTarget(self, action: #selector(addressButtonClick), for: .touchUpInside)
    
    imageView.image = UIImage(named: "Ellipse 258")
    imageView.contentMode = .scaleToFill
    view.addSubview(imageView)
    
    dateButton.setTitle("수요일", for: .normal)
    dateButton.backgroundColor = .clear
    dateButton.setTitleColor(.white, for: .normal)
    dateButton.addTarget(self, action: #selector(dateButtonClicked), for: .touchUpInside)
    imageView.addSubview(dateButton)
    
    dateButton.setImage(UIImage(named: "Group 833"), for: .normal)
    dateButton.addTarget(self, action: #selector(dateButtonClicked), for: .touchUpInside)
    view.addSubview(dateButton)
    
    textLabel.text = "오늘 11시 50분 전 예약하면\n 내일 오전 7시 전 수거!"
    textLabel.numberOfLines = 2
    textLabel.textColor = UIColor.lightGray.withAlphaComponent(0.9)
    textLabel.font = UIFont.boldSystemFont(ofSize: 15)
    textLabel.textAlignment = .center
    view.addSubview(textLabel)
    
    
    reserveButton.setTitle("예약하기", for: .normal)
    reserveButton.setTitleColor(.white, for: .normal)
    reserveButton.backgroundColor = UIColor(red: 153/255, green: 193/255, blue: 252/255, alpha: 1)
    reserveButton.layer.cornerRadius = view.frame.width/17
    reserveButton.addTarget(self, action: #selector(reserveClicked(_:)), for: .touchUpInside)
    view.addSubview(reserveButton)
    
    popUpView.backgroundColor = ColorPiker.customHanul
    popUpView.addSubview(cancelButton)
    view.addSubview(popUpView)
    
    loginButton.setTitle("로그인", for: .normal)
    loginButton.setTitleColor(ColorPiker.customHanul, for: .normal)
    loginButton.backgroundColor = UIColor.white
    loginButton.layer.cornerRadius = 25
    loginButton.addTarget(self, action: #selector(moveToLoginPage), for: .touchUpInside)
    popUpView.addSubview(loginButton)
    
    cancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
    cancelButton.addTarget(self, action: #selector(clickCancelButton(_:)), for: .touchUpInside)
    popUpView.addSubview(cancelButton)
  }
  
  
  
  //MARK: - setConstraint()
  private func setConstraint() {
    
    
    [addressButton, divider1, textLabel, dateButton, reserveButton, popUpView, loginButton, cancelButton].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      addressButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 21),
      addressButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      addressButton.heightAnchor.constraint(equalToConstant: 50),
      
      
      divider1.topAnchor.constraint(equalTo: addressButton.bottomAnchor, constant: 10),
      divider1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      divider1.heightAnchor.constraint(equalToConstant: 1),
      divider1.widthAnchor.constraint(equalToConstant: view.frame.width),
      
      
      dateButton.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: 40),
      dateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      dateButton.heightAnchor.constraint(equalToConstant: 158),
      dateButton.widthAnchor.constraint(equalToConstant: 158),
      
      
      
      textLabel.topAnchor.constraint(equalTo: dateButton.bottomAnchor, constant: 24),
      textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      textLabel.widthAnchor.constraint(equalToConstant: 200),
      textLabel.heightAnchor.constraint(equalToConstant: 50),
      
      
      reserveButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant : 38),
      reserveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      reserveButton.widthAnchor.constraint(equalToConstant: 251),
      reserveButton.heightAnchor.constraint(equalToConstant: 44),
      
      popUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      popUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      loginButton.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 138),
      loginButton.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 62),
      loginButton.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: -62),
      loginButton.heightAnchor.constraint(equalToConstant: 43.86),
      
      
      cancelButton.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 6),
      cancelButton.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 329),
      cancelButton.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: -2),
      cancelButton.heightAnchor.constraint(equalToConstant: 44)
      
    ])
    
    let defaultCenterYConst = popUpView.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: 130)
    defaultCenterYConst.priority = UILayoutPriority(500)
    defaultCenterYConst.isActive  = true
    
    floatingCenterYConstraint = popUpView.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -180)
    floatingCenterYConstraint.priority = .defaultLow
    floatingCenterYConstraint.isActive = true
    
  }
  
  
  
  //MARK:- Action
  
  @objc func addressButtonClick() {
    dismiss(animated: true)
  }
  
  @objc func dateButtonClicked() {
    let selectDateVC = UINavigationController(rootViewController: SelectDateView())
    selectDateVC.modalPresentationStyle = .fullScreen
    present(selectDateVC, animated: true)
  }
  
  @objc func reserveClicked(_ sender: UIButton){
    if loginCheck == false {
      view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
      
      UIView.animate(withDuration: 0.4) {
        self.floatingCenterYConstraint.priority = .defaultHigh
        self.view.layoutIfNeeded()
      }
      loginCheck = true
    } else {
      let vc = SelectReserveViewController()
      vc.modalPresentationStyle = .fullScreen
      present(vc, animated: true)
      
      
      
      let homeVC = HomeViewController()
      homeVC.hidingView.alpha = 1
      homeVC.hidingView.backgroundColor = .lightGray
    }
  }
  
  @objc func clickCancelButton(_ sender : UIButton) {
    
    view.backgroundColor = .clear
    UIView.animate(withDuration: 0.4) {
      self.floatingCenterYConstraint.priority  =  .defaultLow
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc func moveToLoginPage() {
    let loginVC = LoginViewController()
    let loginNavi = UINavigationController(rootViewController: loginVC)
    loginNavi.modalPresentationStyle = .fullScreen
    present(loginNavi, animated: true)
    
    view.backgroundColor = .clear
    UIView.animate(withDuration: 0.4) {
      self.floatingCenterYConstraint.priority  =  .defaultLow
      self.view.layoutIfNeeded()
    }
    
  }
}
