//
//  LoginViewController.swift
//  Pagetest
//
//  Created by Qussk_MAC on 2020/07/15.
//  Copyright © 2020 Qussk_MAC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  let idTextField = UITextField()
  let pwTextField = UITextField()
  let loginButton = UIButton()
  let loginLable = UILabel()
  let signUpButton = UIButton()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground

    setView()
    setConstrain()
    setNavigationBar()
    navigationLess()
  }
  
  
  func navigationLess(){
    //네비게이션바 디자인 생략
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
  
  func setView(){
    loginButton.setTitle("로그인", for: .normal)
    loginButton.backgroundColor = ColorPiker.customHanul
    loginButton.setTitleColor(.white, for: .normal)
    loginButton.layer.cornerRadius = view.frame.width/17
    loginButton.addTarget(self, action: #selector(loginGoing(_:)), for: .touchUpInside)
    
    loginLable.alpha = 0
    
    idTextField.borderStyle = .none
    idTextField.keyboardType = .numberPad
    idTextField.placeholder = "전화번호"
    idTextField.font = UIFont.systemFont(ofSize: 14)
    
    pwTextField.borderStyle = .none
    pwTextField.keyboardType = .emailAddress
    pwTextField.isSecureTextEntry = true
    pwTextField.placeholder = "비밀번호"
    pwTextField.font = UIFont.systemFont(ofSize: 14)
    
    loginLable.text = "혹시, 쓸애기가 처음이신가요?"
    loginLable.font = UIFont.systemFont(ofSize: 16)
    
    signUpButton.setTitle("회원가입", for: .normal)

//    signUpButton.setTitleColor(UIColor(red: 78/255, green: 239/255, blue: 169/255, alpha: 1), for: .normal)

    signUpButton.setTitleColor(UIColor(red: 78/255, green: 239/255, blue: 168/255, alpha: 1), for: .normal)

    signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    
    signUpButton.alpha = 0
    
  }
  
  @objc func loginGoing(_ sender: UIButton){
    dismiss(animated: true)
  }
  
  func setConstrain(){
    
    let guide = view.safeAreaLayoutGuide
    
    [idTextField,pwTextField,loginButton,loginLable,signUpButton].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview($0)
    }
    
    [idTextField,pwTextField].forEach{
      $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
      $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
    }
    
    
    NSLayoutConstraint.activate([
      
      idTextField.topAnchor.constraint(equalTo: guide.topAnchor, constant: 60),
      idTextField.heightAnchor.constraint(equalToConstant: 44),
      
      pwTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 26),
      pwTextField.heightAnchor.constraint(equalToConstant: 44),
      
      loginButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 36),
      loginButton.heightAnchor.constraint(equalToConstant: 44),
      loginButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      loginButton.widthAnchor.constraint(equalToConstant: 251),
      
      loginLable.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      loginLable.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -5),
      
      signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -106),
      signUpButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
    ])
  }
  
  func setNavigationBar(){
    
    navigationItem.title = "로그인"
    let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(clickXmarkButton))
    navigationItem.rightBarButtonItem = barButtonItem
    //
  }
  
  func passwordUnderline() {
    pwTextField.borderStyle = .none
    let border = CALayer()
    border.frame = CGRect(x: 0, y: pwTextField.frame.size.height-1, width: pwTextField.frame.width, height: 0.5)
    border.backgroundColor = UIColor.gray.cgColor
    pwTextField.layer.addSublayer((border))
    
    
    idTextField.borderStyle = .none
    
    let border1 = CALayer()
    border1.frame = CGRect(x: 0, y: idTextField.frame.size.height-1, width: idTextField.frame.width, height: 0.5)
    border1.backgroundColor = UIColor.gray.cgColor
    idTextField.layer.addSublayer((border1))
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    
    UIView.animate(withDuration: 0.5, animations: {
      self.loginLable.alpha = 1
      self.signUpButton.alpha = 1
      
    })
    passwordUnderline()
    
    
  }
  
  @objc func clickXmarkButton () {
    self.dismiss(animated: true, completion: nil)
  }
  
  
}
