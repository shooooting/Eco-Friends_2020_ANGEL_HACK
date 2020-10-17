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
  
  let onboardingImage = UIImageView()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    onboarding.dataSource = self
    onboarding.delegate = self
    setupOnboarding()
    setView()
    navigationLess()
  }
  
  func navigationLess(){
    //네비게이션바 디자인 생략
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
  
  
  
  //MARK:- UI
   func setView(){
    
    getButton.backgroundColor = ColorPiker.customHanul
    getButton.alpha = 0
    getButton.layer.cornerRadius = view.frame.width/20
    getButton.setTitle("쓸-애기 시작하기", for: .normal)
    getButton.setTitleColor(.white, for: .normal)
    onboarding.addSubview(getButton)
    getButton.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
    
    onboardingImage.contentMode = .scaleAspectFill
    onboarding.addSubview(onboardingImage)
    
    
    
    getButton.translatesAutoresizingMaskIntoConstraints = false
    onboardingImage.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      
      onboardingImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
      onboardingImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      onboardingImage.widthAnchor.constraint(equalToConstant: 320),
      onboardingImage.heightAnchor.constraint(equalToConstant: 360),
      
      getButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      getButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      getButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
      getButton.heightAnchor.constraint(equalToConstant: 44),
      
      
    ])
  }
  //MARK: -viewDidAppear

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    self.onboardingImage.alpha = 1.0
    self.onboardingImage.image = UIImage(named: "on1")
    
  //  self.onboardingImage.kf.indicatorType = .activity
  //  let gifs = ["https://qussk.github.io/image/PET.gif"]
  //  self.onboardingImage.kf.setImage(with: URL(string: gifs[0])!)
    print("dd")
  }
  
  
  //MARK: - Onboarding
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
    
    
    let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
    let descirptionFont = UIFont(name: "AvenirNext-Regular", size: 18)!
    
    return [OnboardingItemInfo(informationImage: UIImage(named:"back")!,
                                 title: "확실한 분리수거",
                                 description: "폐기물 처리 가이드를 통해\n궁금했던 분리수거 방법을 알아보세요.\n잘못된 분리수거 방법을 바로 잡아요",
                                 pageIcon: UIImage(named:"on")!,
                                 color: UIColor.white,
                                 titleColor: UIColor.black,
                                 descriptionColor: UIColor.black,
                                 titleFont: titleFont,
                                 descriptionFont: descirptionFont),
              OnboardingItemInfo(informationImage: UIImage(named:"back")!,
                                 title: "집 앞에서 픽업",
                                 description: "잠들기 전, 집 문 앞에 폐기물을 놓아두고\n쓸애기 서비스를 이용해보세요.\n잠든 사이에 빠르게 수거해 갈게요.",
                                 pageIcon: UIImage(named:"on")!,
                                 color: UIColor.white,
                                 titleColor: UIColor.black,
                                 descriptionColor: UIColor.black,
                                 titleFont: titleFont,
                                 descriptionFont: descirptionFont),
              OnboardingItemInfo(informationImage: UIImage(named:"back")!,
                                 title: "새롭게 재탄생!",
                                 description: "정성껏 분리수거된 재활용 폐기물은\n종류별로 나눠져 재활용 업체에 넘어갑니다\n나의 작은 노력 하나로 깨끗한 지구를 만들어요!",
                                 pageIcon: UIImage(named:"on")!,
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
  present(adressNV, animated: false)
  
  
}
}


//MARK:-PaperOnboardingDelegate
extension OnboardingViewController: PaperOnboardingDelegate {

   func onboardingConfigurationItem(_: OnboardingContentViewItem, index _: Int) {
      
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
      
      if index == 0 {
        if self.getButton.alpha == 1 {
          UIView.animate(withDuration: 0.1, animations: {
            self.getButton.alpha = 0
          })
        }
      }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
      if index == 0 {
        UIView.animate(withDuration: 0.1, animations: {
          self.onboardingImage.alpha = 1
          self.onboardingImage.image = UIImage(named: "on1")
        })
      }else if index == 1 {
        UIView.animate(withDuration: 0.1, animations: {
          //self.onboardingImage.alpha = 0
          self.onboardingImage.image = UIImage(named: "on2")

        })
        
      } else {
        UIView.animate(withDuration: 0.2, animations: {
          self.onboardingImage.image = UIImage(named: "on3")
          self.getButton.alpha = 1
        })
        
      }
    }
    
    
    
  }
