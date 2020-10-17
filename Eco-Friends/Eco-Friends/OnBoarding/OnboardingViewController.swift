//
//  ViewController.swift
//  Pagetest
//
//  Created by Qussk_MAC on 2020/07/14.
//  Copyright © 2020 Qussk_MAC. All rights reserved.
//

import UIKit
import PaperOnboarding

class OnboardingViewController: UIViewController {
  
  let onboarding = PaperOnboarding()
  let getButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    onboarding.dataSource = self
    onboarding.delegate = self
    setupOnboarding()
    setButton()
  }
  
  //MARK:- UI
  func setButton(){
    
    getButton.backgroundColor = ColorPiker.customHanul
    getButton.alpha = 0
    getButton.layer.cornerRadius = view.frame.width/20
    getButton.setTitle("쓸-애기 시작하기", for: .normal)
    getButton.setTitleColor(.white, for: .normal)
    onboarding.addSubview(getButton)
    getButton.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
    
    getButton.translatesAutoresizingMaskIntoConstraints = false
    
    getButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    getButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    getButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180).isActive = true
    getButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
  }
  
  
  func setupOnboarding(){
    view.backgroundColor = .white
    view.addSubview(onboarding)
    
    onboarding.translatesAutoresizingMaskIntoConstraints = false
    
    for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
      let constraint = NSLayoutConstraint(item: onboarding,
                                          attribute: attribute,
                                          relatedBy: .equal,
                                          toItem: view,
                                          attribute: attribute,
                                          multiplier: 1,
                                          constant: 0)
      view.addConstraint(constraint)
    }
  }
  
}

//MARK:-PaperOnboardingDataSource
extension OnboardingViewController: PaperOnboardingDataSource {
  
  func onboardingItem(at index: Int) -> OnboardingItemInfo {
    
//    let bgOne = UIColor(red: 217/255, green: 72/255, blue: 89/255, alpha: 1)
//    let bgTwo = UIColor(red: 186/255, green: 166/255, blue: 211/255, alpha: 1)
//    let bgThree = UIColor(red: 168/255, green: 166/255, blue: 78/255, alpha: 1)
    
    let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
    let descirptionFont = UIFont(name: "AvenirNext-Regular", size: 18)!
    
    return [OnboardingItemInfo(informationImage: UIImage(named:"naver")!,
                               title: "환경을 살리는 분리수거",
                               description: "11111111111111\n11111111111111\n111111111111",
                               pageIcon: UIImage(named:"naver")!,
                               color: UIColor.white,
                               titleColor: UIColor.black,
                               descriptionColor: UIColor.black,
                               titleFont: titleFont,
                               descriptionFont: descirptionFont),
            OnboardingItemInfo(informationImage: UIImage(named:"naver")!,
                               title: "환영합니다2",
                               description: "ㅏㅓㅓㅓㅓㅓㅓㅓ",
                               pageIcon: UIImage(named:"naver")!,
                               color: UIColor.white,
                               titleColor: UIColor.black,
                               descriptionColor: UIColor.black,
                               titleFont: titleFont,
                               descriptionFont: descirptionFont),
            OnboardingItemInfo(informationImage: UIImage(named:"naver")!,
                               title: "환영합니다",
                               description: "ㅏㅓㅓㅓㅓㅓㅓㅓ",
                               pageIcon: UIImage(named:"naver")!,
                               color: UIColor.white,
                               titleColor: UIColor.black,
                               descriptionColor: UIColor.black,
                               titleFont: titleFont,
                               descriptionFont: descirptionFont)
      ][index]
  }
  func onboardingItemsCount() -> Int {
    return 3
  }


//MARK:- Action
@objc func buttonClicked(_ sender: UIButton){
  
  let adressVC = AddressViewController()
  let adressNV = UINavigationController(rootViewController: adressVC)

  adressNV.modalPresentationStyle = .fullScreen
  present(adressNV, animated: true)
  
  
}
}


//MARK:-PaperOnboardingDelegate
extension OnboardingViewController: PaperOnboardingDelegate {

  func onboardingConfigurationItem(_: OnboardingContentViewItem, index _: Int) {
    
  }
  
  func onboardingWillTransitonToIndex(_ index: Int) {
     if index == 1 {
         if self.getButton.alpha == 1 {
           UIView.animate(withDuration: 0.1, animations: {
             self.getButton.alpha = 0
           })
         }
       }
  }
  func onboardingDidTransitonToIndex(_ index: Int) {
    if index == 2 {
        UIView.animate(withDuration: 0.2, animations: {
          self.getButton.alpha = 1
        })
    }
  }
}



