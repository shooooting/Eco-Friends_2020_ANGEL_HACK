//
//  ReserveViewController.swift
//  Pagetest
//
//  Created by Qussk_MAC on 2020/07/16.
//  Copyright © 2020 Qussk_MAC. All rights reserved.
//

import UIKit

class ReserveViewController: UIViewController {
  
  let collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    return UICollectionView(frame: .zero, collectionViewLayout: layout)
  }()
  
  let backButton = UIButton()
  let reserveButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "예약하기"
    
    collectionView.dataSource = self
    collectionView.delegate = self
    view.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
    
    setupView()
    setupConstrain()
    KeyboardShow()
    
  }
  
  
  //MARK:- UI
  func setupView(){
    
    collectionView.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
    collectionView.register(ReserveSection1CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    collectionView.register(ReserveSection2CollectionViewCell.self, forCellWithReuseIdentifier: "Cell2")
    collectionView.register(ReserveSection3CollectionViewCell.self, forCellWithReuseIdentifier: "Cell3")
    view.addSubview(collectionView)
    
    backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
    backButton.tintColor = .lightGray
    collectionView.addSubview(backButton)
    backButton.addTarget(self, action: #selector(backClick), for: .touchUpInside)
    
    //67, 187, 254
    reserveButton.backgroundColor = ColorPiker.customHanul
    reserveButton.setTitle("예약하기", for: .normal)
    reserveButton.setTitleColor(.white, for: .normal)
    reserveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    reserveButton.layer.cornerRadius = view.frame.width/17
    collectionView.addSubview(reserveButton)
    
    reserveButton.addTarget(self, action: #selector(reserveClick(_:)), for: .touchUpInside)
  }
  
  @objc func backClick(_ sender: UIButton){
    dismiss(animated: true)
  }
  
  @objc func reserveClick(_ sender: UIButton){
    
    let vc = ReserveCompleteViewController()
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: false)
    dismiss(animated: true)
  }
  
  func setupConstrain(){
    
    let guide = view.safeAreaLayoutGuide
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    reserveButton.translatesAutoresizingMaskIntoConstraints = false
    backButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      
      collectionView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 12),
      collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
      // collectionView.heightAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 1)
      
      backButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 8),
      backButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16),
      backButton.heightAnchor.constraint(equalToConstant: 20),
      backButton.widthAnchor.constraint(equalToConstant: 12),
      
      reserveButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      reserveButton.heightAnchor.constraint(equalToConstant: 44),
      reserveButton.widthAnchor.constraint(equalToConstant: 251),
      reserveButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20)
      
    ])
  }
  
  struct Standard {
    static let standard: CGFloat = 12
    static var inset = UIEdgeInsets(top: 12, left: 18, bottom: 0, right: 18)
  }
  
}

//MARK:-UICollectionViewDataSource
extension ReserveViewController : UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    3
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    
    if section == 0 {
      return 1
    } else if section == 1 {
      return 1
    } else {
      return 1
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    if indexPath.section == 0 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ReserveSection1CollectionViewCell
      
      cell.backgroundColor = .white
      cell.layer.cornerRadius = view.frame.width/19
      
      
      return cell
      
    }else if indexPath.section == 1 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! ReserveSection2CollectionViewCell
      
      cell.backgroundColor = .white
      cell.layer.cornerRadius = view.frame.width/19
      
      return cell
    }else{
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell3", for: indexPath) as! ReserveSection3CollectionViewCell
      
      cell.backgroundColor = .white
      cell.layer.cornerRadius = view.frame.width/19
      
      return cell
    }
  }
  
  //옵저버 등록
  func KeyboardShow() {
    NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillShow(_:)),name: UIResponder.keyboardWillShowNotification,object: nil)
    NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillHide(_:)),name: UIResponder.keyboardWillHideNotification,object: nil)
  }
  
  
  
  @objc private func keyboardWillShow(_ notification: Notification) {
    collectionView.frame.origin.y = -100 }
  
  @objc private func keyboardWillHide(_ notification: Notification) {
    collectionView.frame.origin.y = 60 }
  
}




//MARK:-UICollectionViewDelegateFlowLayout
extension ReserveViewController: UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    Standard.inset
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    Standard.standard
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    if indexPath.section == 0{
      
      let width = collectionView.frame.width - Standard.inset.left - Standard.inset.right - Standard.standard
      let height = view.frame.height/2.5
      print(width)
      
      return CGSize(width: width, height: height)
      
    } else if indexPath.section == 1{
      
      let width = collectionView.frame.width - Standard.inset.left - Standard.inset.right - Standard.standard
      let height = collectionView.frame.height/6.1
      
      return CGSize(width: width, height: height)
      
    } else {
      
      let width = collectionView.frame.width - Standard.inset.left - Standard.inset.right - Standard.standard
      let height = collectionView.frame.height/6.1
      
      return CGSize(width: width, height: height)
      
    }
  }
}
