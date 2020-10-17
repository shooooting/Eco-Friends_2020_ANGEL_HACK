//
//  LaunchViewController.swift
//  Eco-Friends
//
//  Created by Qussk_MAC on 2020/07/19.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

  let launchImage = UIImageView()
  let img = UIImageView()
  
    override func viewDidLoad() {
        super.viewDidLoad()

      setView()
      constrain()
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
       let vc = OnboardingViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
      }
  }
    
  func setView(){
    
    launchImage.image = UIImage(named: "blue")
    view.addSubview(launchImage)
    
    img.image = UIImage(named: "런치스크린")
    view.addSubview(img)
  }
  
  //
  func constrain(){
    
    launchImage.translatesAutoresizingMaskIntoConstraints = false
    img.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      
      launchImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -10),
      launchImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
      launchImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
      launchImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      img.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      img.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      img.widthAnchor.constraint(equalToConstant: 116),
      img.heightAnchor.constraint(equalToConstant: 94)
    ])
      
    
  }

}
