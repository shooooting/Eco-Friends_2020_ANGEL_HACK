//
//  OrderListPageView.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/18.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class OrderListPageView : UIViewController {
  //MARK: - Properties
  
  private let collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    return UICollectionView(frame: .zero, collectionViewLayout: layout)
  }()
  var number : [String] = ["20200712-952", "20200329-304", "20045925-103"]
  var status : [String] = ["수거대기", "수거완료", "수거완료"]
  var date : [String] = ["수거 7/15 (수)", "수거 7/12 (일)", "수거 7/19 (목)"]
  //MARK: - viewDidLoad()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
    setNavigation()
    setUI()
    setConstraint()
  }
  
  //MARK: - struct
  struct Standard {
    static let standard: CGFloat = 12
    static var inset = UIEdgeInsets(top: 12, left: 18, bottom: 0, right: 18)
  }
  //MARK: - setNavigation()
  private func setNavigation() {
    navigationItem.title = "주문목록"
  }
  
  //MARK: - setUI()
  private func setUI() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(OrderListPageViewCollectionCell.self, forCellWithReuseIdentifier: OrderListPageViewCollectionCell.identifier)
    view.addSubview(collectionView)
  }
  
  //MARK: -setConstraint()
  
  private func setConstraint() {
    let guide = view.safeAreaLayoutGuide
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: guide.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    ])
  }
}

//MARK: - UICollectionViewDataSource

extension OrderListPageView : UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    1
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderListPageViewCollectionCell.identifier, for: indexPath) as! OrderListPageViewCollectionCell
    cell.backgroundColor = .white
    cell.layer.cornerRadius = view.frame.width / 19
    cell.configure(number : number[indexPath.item],status: status[indexPath.item], date: date[indexPath.item] )
    return cell
  }
}

//MARK: - UICollectionViewDelegate
extension OrderListPageView : UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let orderWaitingVC = OrderListWaitingView()
    orderWaitingVC.modalPresentationStyle = .fullScreen
    navigationController?.pushViewController(orderWaitingVC, animated: true)
  }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension OrderListPageView : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return Standard.standard
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return Standard.inset
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 339, height: 122)
  }
}
