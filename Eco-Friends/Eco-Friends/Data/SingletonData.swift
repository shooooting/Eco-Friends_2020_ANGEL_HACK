//
//  Data.swift
//  Eco-Friends
//
//  Created by ㅇ오ㅇ on 2020/07/18.
//  Copyright © 2020 shooooting. All rights reserved.
//

import Foundation

class SingletonClass {
  static var shared = SingletonClass()
  private init() {}
  
  var arrData: [String] = []
}


