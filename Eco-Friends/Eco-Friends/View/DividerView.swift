//
//  DividerView.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/16.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class DividerView : UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)

  }

  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
