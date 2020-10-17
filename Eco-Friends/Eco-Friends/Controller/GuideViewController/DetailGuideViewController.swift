//
//  DetailGuideViewController.swift
//  Eco-Friends
//
//  Created by Qussk_MAC on 2020/07/19.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit
import Kingfisher

class DetailGuideViewController: UIViewController {
  
  var scrollView = UIScrollView()
  
  let guideView = UIView()
  let guideimage = UIImageView()
  
  let titleView = UIView()
  let titleLable = UILabel()
  
  let detailView = UIView()
  let detailTitle = UILabel()
  
  let ch1 = UILabel()
  let ch2 = UILabel()
  let ch3 = UILabel()
  let ch4 = UILabel()
  
  let dateilTitle2 = UILabel()
  
  let detailImageView = UIImageView()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "가이드"
    setView()
    setConstrain()
    
  }
  //MARK: -kf

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    
    self.guideimage.alpha = 1.0
    //self.guideimage.image = UIImage(named: "blue")
    
    self.guideimage.kf.indicatorType = .activity
    let gifs = ["https://qussk.github.io/image/PET.gif"]
    self.guideimage.kf.setImage(with: URL(string: gifs[0])!)
    
    
  }
  

  
  //MARK: -UI
  func setView(){
    
    scrollView.backgroundColor = .white
    view.addSubview(scrollView)
    
    guideView.backgroundColor = .white
    scrollView.addSubview(guideView)
    
    guideimage.clipsToBounds = true
    guideimage.contentMode = .scaleAspectFit
    // guideimage.image = UIImage(named: "blue")
    scrollView.addSubview(guideimage)
    
    titleView.backgroundColor = ColorPiker.customHanul
    titleView.layer.cornerRadius = view.frame.width/17
    scrollView.addSubview(titleView)
    
    titleLable.text = "플라스틱류"
    titleLable.textColor = .white
    titleLable.font = UIFont.boldSystemFont(ofSize: 18)
    titleView.addSubview(titleLable)
    
    detailView.backgroundColor = .white
    detailView.layer.cornerRadius = view.frame.width/17
    scrollView.addSubview(detailView)
    
    detailTitle.text = "분리배출 요령"
    detailTitle.font = UIFont.boldSystemFont(ofSize: 20)
    detailView.addSubview(detailTitle)
    
    
    //가이드
    let attributedString1 = NSMutableAttributedString(string: "")
    let i1 = NSTextAttachment()
    i1.image = UIImage(named: "check")
    i1.bounds = CGRect(x: 0, y: 0, width: 18, height: 14)
    attributedString1.append(NSAttributedString(attachment: i1))
    attributedString1.append(NSAttributedString(string: " 뚜껑을 제거한 후, 내용물을 비우고 물로 한번 헹구어 배출"))
    ch1.attributedText = attributedString1
    ch1.numberOfLines = 0
    ch1.font = UIFont(name: "PingFangHK-Light", size: 16)
    detailView.addSubview(ch1)
    
    let attributedString2 = NSMutableAttributedString(string: "")
    let i2 = NSTextAttachment()
    i2.image = UIImage(named: "check")
    i2.bounds = CGRect(x: 0, y: 0, width: 18, height: 14)
    attributedString2.append(NSAttributedString(attachment: i2))
    attributedString2.append(NSAttributedString(string: " 가능한 압착하여 부피를 축소"))
    ch2.attributedText = attributedString2
    ch2.numberOfLines = 0
    ch2.font = UIFont(name: "PingFangHK-Light", size: 16)
    detailView.addSubview(ch2)
    
    let attributedString3 = NSMutableAttributedString(string: "")
    let i3 = NSTextAttachment()
    i3.image = UIImage(named: "check")
    i3.bounds = CGRect(x: 0, y: 0, width: 18, height: 14)
    attributedString3.append(NSAttributedString(attachment: i3))
    attributedString3.append(NSAttributedString(string: " 알루미늄 뚜껑은 고철로 분리 배출 "))
    ch3.attributedText = attributedString3
    ch3.numberOfLines = 0
    ch3.font = UIFont(name: "PingFangHK-Light", size: 16)
    detailView.addSubview(ch3)
    
    let attributedString4 = NSMutableAttributedString(string: "")
    let i4 = NSTextAttachment()
    i4.image = UIImage(named: "check")
    i4.bounds = CGRect(x: 0, y: 0, width: 18, height: 14)
    attributedString4.append(NSAttributedString(attachment: i4))
    attributedString4.append(NSAttributedString(string: " 용기 표면에 재질분류 표시(1, 2, 3, 4, 5, 6 번)된 플라스틱 제품에 한하여 배출 "))
    ch4.attributedText = attributedString4
    ch4.numberOfLines = 0
    ch4.font = UIFont(name: "PingFangHK-Light", size: 16)
    detailView.addSubview(ch4)
    
    
    //
//    dateilTitle2.text = "플라스틱 종류"
//    dateilTitle2.font = UIFont.boldSystemFont(ofSize: 20)
//    detailView.addSubview(dateilTitle2)
    
    
    detailImageView.image = UIImage(named: "detail")
    detailImageView.contentMode = .scaleAspectFit
    detailView.addSubview(detailImageView)
    
  }
  
  //MARK: -UI
  func setConstrain(){
    //Views
    [scrollView,guideView,guideimage,titleView,detailView,detailImageView].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //Title
    [titleLable,detailTitle].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
      $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    
    //check
    [ch1, ch2, ch3, ch4].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22).isActive = true
      $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22).isActive = true
    }
//
//    [dateilTitle2].forEach{
//      $0.translatesAutoresizingMaskIntoConstraints = false
//      $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//      $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//    }
    
    NSLayoutConstraint.activate([
      
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      guideView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      guideView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      guideView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      guideView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
      guideView.heightAnchor.constraint(equalToConstant: 424),
      
      guideimage.centerXAnchor.constraint(equalTo: guideView.centerXAnchor),
      guideimage.centerYAnchor.constraint(equalTo: guideView.centerYAnchor),
      guideimage.widthAnchor.constraint(equalToConstant: 280),
      guideimage.heightAnchor.constraint(equalToConstant: 280),
      
      
      titleView.topAnchor.constraint(equalTo: guideView.bottomAnchor, constant: -39),
      titleView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      titleView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      // titleView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
      titleView.heightAnchor.constraint(equalToConstant: 114),
      
      titleLable.topAnchor.constraint(equalTo: titleView.topAnchor, constant: 20),
      
      
      detailView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -58),
      detailView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      detailView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      detailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
      detailView.heightAnchor.constraint(equalToConstant: 1120),
      
      detailTitle.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 32),
      
      ch1.topAnchor.constraint(equalTo: detailTitle.bottomAnchor, constant: 18),
      ch2.topAnchor.constraint(equalTo: ch1.bottomAnchor, constant: 10),
      ch3.topAnchor.constraint(equalTo: ch2.bottomAnchor, constant: 10),
      ch4.topAnchor.constraint(equalTo: ch3.bottomAnchor, constant: 10),
      
     // dateilTitle2.topAnchor.constraint(equalTo: ch4.bottomAnchor,constant: 32),
      
      detailImageView.topAnchor.constraint(equalTo: ch4.bottomAnchor),
      detailImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      detailImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      detailImageView.heightAnchor.constraint(equalToConstant: 800),
      //  detailImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      
    ])
    
  }
  
}
