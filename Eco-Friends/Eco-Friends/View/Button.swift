//
//  Button.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/16.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class Button : UIButton {
  
  let buttonImage = UIImageView()
  override init(frame: CGRect) {
    super.init(frame : frame)
    
    layer.cornerRadius = 5
    backgroundColor = UIColor(red: 67/255, green: 187/255, blue: 254/255, alpha: 1)
    buttonImage.backgroundColor = .red
      
    addSubview(buttonImage)
    tintColor = .lightGray
    titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
    sizeToFit()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
