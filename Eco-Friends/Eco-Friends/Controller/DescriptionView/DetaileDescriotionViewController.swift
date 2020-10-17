//
//  DetaileDescriotionViewController.swift
//  Eco-Friends
//
//  Created by Qussk_MAC on 2020/07/18.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class DetaileDescriotionViewController: UIViewController {

  //스크롤뷰
  var scrollView = UIScrollView()
  
  let detailimageView = UIImageView()
  let grayImage = UIImageView()
  let detailTitle = UILabel()
  let detailLable = UILabel()
  
  let detailView = UIView()
  let detailView2 = UIView()
  
  let logoIamge = UIImageView()
  let logoLable = UILabel()
  let comentLable = UILabel()
  
  let comentTitle1 = UILabel()
  let comentLable1 = UILabel()
  let comentTitle2 = UILabel()
  let comentLable2 = UILabel()
  let comentTitle3 = UILabel()
  let comentLable3 = UILabel()

  let viewsButton = UIButton()

  let naviBackButton: UIBarButtonItem = {
    let button = UIBarButtonItem(title: "", style: .done, target: self, action: #selector(xButtonMove(_:)))
    return button
  }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      title = "로티스"
      
      setView()
      setConstrain()
      navigationLess()

    }
  
  func navigationLess(){
    //네비게이션바 디자인 생략
    navigationItem.leftBarButtonItem = naviBackButton
    naviBackButton.image = UIImage(systemName: "chevron.left")
    naviBackButton.tintColor = .black
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
    
  //MARK:- UI
  func setView(){

    
    scrollView.backgroundColor = .white
    view.addSubview(scrollView)
    
    detailimageView.clipsToBounds = true
    detailimageView.image = UIImage(named: "dc1")
    scrollView.addSubview(detailimageView)

    grayImage.image = UIImage(named: "Vac")
    detailimageView.addSubview(grayImage)
    
    detailTitle.text = "로티스"
    detailTitle.textColor = .white
    detailTitle.font = UIFont.systemFont(ofSize: 16)
    detailimageView.addSubview(detailTitle)

    detailLable.text = "페트병으로 만드는\n패션아이템"
    detailLable.numberOfLines = 2
    detailLable.textColor = .white
    detailLable.font = UIFont.boldSystemFont(ofSize: 28)
    detailimageView.addSubview(detailLable)

    detailView.backgroundColor = .white
    detailView.layer.cornerRadius = view.frame.width/17
    scrollView.addSubview(detailView)

    logoLable.text = "로티스"
    logoLable.backgroundColor = .white
    comentLable.textColor = ColorPiker.customTextColor
    logoLable.font = UIFont.systemFont(ofSize: 16)
    scrollView.addSubview(logoLable)
   
    //scrollView.delegate = self

    logoIamge.image = UIImage(named: "logo1")
    logoIamge.clipsToBounds = true
    detailView.addSubview(logoIamge)


    //상세
    comentLable.text = "로티스는 오늘날 주목할만한 여성들에게서 영감을 받았습니다. 로티스는 이들이 하루를 의미있게 보낼 수 있도록 도와주는 지속가능한 스타일을 만드는데에 자부심을 느끼고 있습니다. 제조의 매 단계마다 이들과 함께 하며 끊임없이 노력하고 있습니다.\n "
    comentLable.numberOfLines = 0
    comentLable.font = UIFont.systemFont(ofSize: 16)
    comentLable.textColor = ColorPiker.customTextColor

    //1
    comentTitle1.text = "무엇을 할까요?"
    comentTitle1.font = UIFont.boldSystemFont(ofSize: 24)
    comentTitle1.textColor = ColorPiker.customTextColor

    
    comentLable1.text = "로티스가 하는 일의 핵심은 지속 가능한 미래를 만드는 것 입니다. 로티스는 친환경적인 소재를 스타일리쉬하고 착용감이 좋은 제품으로 변형시키는 것을 목표로 하고 있습니다. "
    comentLable1.numberOfLines = 0
    comentLable1.font = UIFont.systemFont(ofSize: 16)
    comentLable1.textColor = ColorPiker.customTextColor

    //2
    comentTitle2.text = "어떻게 할까요?"
    comentTitle2.font = UIFont.boldSystemFont(ofSize: 24)
    comentTitle2.textColor = ColorPiker.customTextColor

    comentLable2.text = "중국 둥관에 있는 로티스가 운영하고 있는 공장은 지속가능하고 책임감 있는 제조의 기준을 정하고 있습니다. 폐기물 제로화를 위해 끊임없이 노력하는 로티스는 최고의 3D 뜨개질 기술과 수공예 조립품을 결합하여 로티스만의 시그니처 스타일과 편안함을 만들어 냅니다."
    comentLable2.font = UIFont.systemFont(ofSize: 16)
    comentLable2.numberOfLines = 0
    comentLable2.textColor = ColorPiker.customTextColor

    //3
    comentTitle3.text = "왜 할까요?"
    comentTitle3.font = UIFont.boldSystemFont(ofSize: 24)
    comentTitle3.textColor = ColorPiker.customTextColor

    comentLable3.text = "로티스는 아름답고 지속 가능한 스타일이 미래의 길이라고 믿습니다. 공유된 경험, 가치 및 제품에 대한 사랑을 통해 고객과의 연결 및 고객과의 관계를 보고싶어 합니다."
    comentLable3.font = UIFont.systemFont(ofSize: 16)
    comentLable3.numberOfLines = 0
    comentLable3.textColor = ColorPiker.customTextColor

    scrollView.showsVerticalScrollIndicator = false

    viewsButton.setTitle("브랜드 더 알아보기", for: .normal)
    viewsButton.setTitleColor(ColorPiker.customHanul, for: .normal)
    viewsButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
    viewsButton.tintColor = ColorPiker.customHanul
    viewsButton.sizeToFit()
    viewsButton.semanticContentAttribute = .forceRightToLeft
    detailView.addSubview(viewsButton)
    viewsButton.addTarget(self, action: #selector(clickedBtn), for: .touchUpInside)
  }
  
  @objc func xButtonMove(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
  }
  
  @objc func clickedBtn(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
  }
  
  //MARK:- setConstrain
  func setConstrain(){
    
//    [detailTitle,detailLable,logoLable,comenteLabel].forEach{
//      $0.translatesAutoresizingMaskIntoConstraints = false
//      $0.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
//      $0.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
//    }
    
    [detailTitle,scrollView,detailimageView,grayImage,detailLable,detailView,logoLable,logoIamge,comentLable, viewsButton].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
   
    [comentLable,comentTitle1,comentLable1,comentTitle2,comentLable2,comentTitle3,comentLable3].forEach{
      detailView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
      $0.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
    }
    
    NSLayoutConstraint.activate([

      scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: -90),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      detailimageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      detailimageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      detailimageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      detailimageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
      detailimageView.heightAnchor.constraint(equalToConstant: 480),
      
      grayImage.topAnchor.constraint(equalTo: detailimageView.topAnchor),
      grayImage.leadingAnchor.constraint(equalTo: detailimageView.leadingAnchor),
      grayImage.trailingAnchor.constraint(equalTo: detailimageView.trailingAnchor),
      grayImage.bottomAnchor.constraint(equalTo: detailimageView.bottomAnchor),
      
      detailTitle.topAnchor.constraint(equalTo: detailimageView.topAnchor, constant: 156),
      detailTitle.leadingAnchor.constraint(equalTo: detailimageView.leadingAnchor, constant: 20),
      detailTitle.trailingAnchor.constraint(equalTo: detailimageView.trailingAnchor, constant: -20),
//
      detailLable.topAnchor.constraint(equalTo: detailTitle.bottomAnchor, constant: 8),
      detailLable.leadingAnchor.constraint(equalTo: detailimageView.leadingAnchor, constant: 20),
      detailLable.trailingAnchor.constraint(equalTo: detailimageView.trailingAnchor, constant: -20),
////
      detailView.topAnchor.constraint(equalTo: detailimageView.bottomAnchor, constant: -39),
      detailView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      detailView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      detailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
      detailView.heightAnchor.constraint(equalToConstant: 830),
      
      logoLable.topAnchor.constraint(equalTo: detailimageView.bottomAnchor),
      logoLable.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
      logoLable.trailingAnchor.constraint(equalTo: detailView.trailingAnchor),
      logoLable.heightAnchor.constraint(equalToConstant: 16),

      logoIamge.topAnchor.constraint(equalTo: logoLable.bottomAnchor, constant: 8),
      logoIamge.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
      logoIamge.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3),
      logoIamge.heightAnchor.constraint(equalToConstant: 19),

      

      
      //상세 1
      comentLable.topAnchor.constraint(equalTo: logoIamge.bottomAnchor, constant: 26),
      
      comentTitle1.topAnchor.constraint(equalTo: comentLable.bottomAnchor, constant: 36),
      
      comentLable1.topAnchor.constraint(equalTo: comentTitle1.bottomAnchor, constant: 16),
      
      comentTitle2.topAnchor.constraint(equalTo: comentLable1.bottomAnchor, constant: 36),
      
      comentLable2.topAnchor.constraint(equalTo: comentTitle2.bottomAnchor, constant: 16),
      
      comentTitle3.topAnchor.constraint(equalTo: comentLable2.bottomAnchor, constant: 36),
      
      comentLable3.topAnchor.constraint(equalTo: comentTitle3.bottomAnchor, constant: 16),
      
      
      viewsButton.topAnchor.constraint(equalTo: comentLable3.bottomAnchor, constant: 40),
      viewsButton.widthAnchor.constraint(equalToConstant: 150),
      viewsButton.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -23),
      viewsButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
    ])
    
  }
}
//
//extension DetaileDescriotionViewController: UIScrollViewDelegate {
//  func scrollViewDidScroll(_ scrollView: UIScrollView) {
//    if scrollView.contentOffset.y > 450 {
//      scrollView.contentOffset.y = 450
//    }
//    print(scrollView.contentOffset.y)
// }
//}
