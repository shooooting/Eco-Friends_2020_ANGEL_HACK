//
//  PopUpLoginView.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/17.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class PopUpLoginView : UIView {
  //MARK: - Properties

  private let imageView = UIImageView()
  private let loginButton = UIButton()
  private let notUserLoginButton = UIButton()
  
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

    imageView.image = UIImage(named: "Group 861")
    imageView.contentMode = .scaleAspectFit
    self.addSubview(imageView)
    

    
    let atts : [NSAttributedString.Key : Any] = [.foregroundColor : UIColor.white, .font : UIFont.systemFont(ofSize : 15)]
    let attributedTitle = NSMutableAttributedString(string: "비회원으로 예약하기", attributes: atts)
    notUserLoginButton.setAttributedTitle(attributedTitle, for: .normal)
    self.addSubview(notUserLoginButton)
  }
  
  //MARK: - setConstraint()
  
  private func setConstraint() {
    
    [ imageView, loginButton, notUserLoginButton].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      
      imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 36.89),
      imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 138),
      imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -139),
      imageView.heightAnchor.constraint(equalToConstant: 92.71),
      

      
      notUserLoginButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 62),
          notUserLoginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 122),
          notUserLoginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -122),
          notUserLoginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -33.62)
    ])
  }
  

}
