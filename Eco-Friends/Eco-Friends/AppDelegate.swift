//
//  AppDelegate.swift
//  Eco-Friends
//
//  Created by ㅇ오ㅇ on 2020/07/16.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
 var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = OnboardingViewController()

    window?.backgroundColor = .systemBackground
    window?.makeKeyAndVisible()
    return true
    
  }
} 
