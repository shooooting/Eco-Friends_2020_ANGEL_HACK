//
//  SelectDateView.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/19.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class SelectDateView : UIViewController {
  //MARK: - Properties
  private let textLabel = UILabel()
  private let subTextLabel = UILabel()
  
  let collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    return UICollectionView(frame: .zero, collectionViewLayout: layout)
  }()
  
  private let selectButton = UIButton()
  
  var dayData : [String] = ["오늘", "월요일", "화요일" ,"수요일", "목요일", "금요일", "토요일", "일요일"]
  var dateData : [String] = ["12일", "13일", "14일", "15일", "16일", "17일", "18일", "19일"]
  var isClicked : Bool = false
  //MARK: - viewDidLoad()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    collectionView.backgroundColor = .systemBackground
    
    setNavigation()
    setUI()
    setConstraint()
  }


  //MARK: - setNavigation()
  
  private func setNavigation() {
    self.title = "예약하기"
    let goBackButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(goBack))
    goBackButton.tintColor = .lightGray
    
    navigationItem.leftBarButtonItem = goBackButton
   }
  
  @objc func goBack() {
//    navigationController?.popViewController(animated: true)
     dismiss(animated: true, completion: nil)
  }
  //MARK: - setUI()
  
  private func setUI() {
    textLabel.text = "수거예약 날짜를\n선택해주세요."
    textLabel.numberOfLines = 2
    textLabel.font = UIFont.boldSystemFont(ofSize: 25)
    textLabel.textAlignment = .left
    textLabel.textColor = .black
    view.addSubview(textLabel)
    
    subTextLabel.text = "선택 날짜의 11시 50분 전에 놓아두면\n다음날 오전 7시 전에 수거해 갈게요."
    subTextLabel.font = UIFont.boldSystemFont(ofSize: 14)
    subTextLabel.numberOfLines = 2
    subTextLabel.textAlignment = .left
    subTextLabel.textColor = .black
    view.addSubview(subTextLabel)
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(SelectDataViewCollectionCell.self, forCellWithReuseIdentifier: SelectDataViewCollectionCell.identifier)
    view.addSubview(collectionView)
    
    selectButton.setTitle("선택완료", for: .normal)
    selectButton.setTitleColor(.white, for: .normal)
    selectButton.backgroundColor = ColorPiker.customHanul
    selectButton.layer.cornerRadius = view.frame.width / 19
    selectButton.addTarget(self, action: #selector(selectButtonDidTap), for: .touchUpInside)
    view.addSubview(selectButton)
    
  }
  
  @objc func selectButtonDidTap() {
    dismiss(animated: true, completion: nil)
  }
  //MARK: - setConstraint()
  
  private func setConstraint() {
    let guide = view.safeAreaLayoutGuide
    
    [textLabel, subTextLabel, collectionView, selectButton].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      textLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 60),
      textLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 18),
//      textLabel.widthAnchor.constraint(equalToConstant: 200),
      textLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 18),
      textLabel.heightAnchor.constraint(equalToConstant: 60),
      
      subTextLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor,constant: 20),
      subTextLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 18),
      subTextLabel.heightAnchor.constraint(equalToConstant: 38),
      
      collectionView.topAnchor.constraint(equalTo: subTextLabel.bottomAnchor, constant: 76),
      collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      collectionView.heightAnchor.constraint(equalToConstant: 125),
      
      selectButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 270),
      selectButton.widthAnchor.constraint(equalToConstant: 251),
      selectButton.heightAnchor.constraint(equalToConstant: 44),
      selectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
      
    ])
    
    
  }
}

//MARK: - UICollectionViewDataSource

extension SelectDateView : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dayData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectDataViewCollectionCell.identifier, for: indexPath) as! SelectDataViewCollectionCell
  
    cell.backgroundColor = .white
    cell.layer.cornerRadius = 10
    cell.clipsToBounds = true
    cell.configure(day: dayData[indexPath.item], date: dateData[indexPath.item])
      
 
    return cell
  }
}

//MARK: - UICollectionViewDelegate
extension SelectDateView : UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if isClicked == false {
    let cell = collectionView.cellForItem(at: indexPath) as! SelectDataViewCollectionCell
    cell.backgroundColor = ColorPiker.customHanul
    cell.dateLabel.textColor = .white
    cell.dayLabel.textColor = .white
      isClicked = true
    } else {
      let cell = collectionView.cellForItem(at: indexPath) as! SelectDataViewCollectionCell
      cell.backgroundColor = .white
      cell.dateLabel.textColor = .black
      cell.dayLabel.textColor = .black
      isClicked = false
    }
  }
  

}
//MARK: - UICollectionViewDelegateFlowLayout

extension SelectDateView : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 96, height: 124)
  }
}
