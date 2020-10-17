//
//  HomeViewController.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/15.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {
  
  //MARK: -  Properties
  let mapView = MKMapView()
  private let myPlace = MKPointAnnotation()
  private let orderChildVC = OrderViewController()
  let naviTitleButton = UIButton(type: .system)
  let hidingView = UIView()
  
  //MARK: - viewDidLoad()
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.isHidden = true
    
    setUI()
    setConstraint()
    setMyPlace()
  }
  
  //MARK: - setUI()
  private func setUI() {
    view.backgroundColor = .systemBackground
    view.addSubview(mapView)
    
    hidingView.backgroundColor = .lightGray
    hidingView.alpha = 0
    mapView.addSubview(hidingView)
    
    addChild(orderChildVC)
    view.addSubview(orderChildVC.view)
    orderChildVC.didMove(toParent: self)
  }
  
  //MARK: - setConstraint()
  private func setConstraint() {
    //    let guide = view.safeAreaLayoutGuide
    
    [mapView, orderChildVC.view, ].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      mapView.topAnchor.constraint(equalTo: view.topAnchor),
      mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      mapView.heightAnchor.constraint(equalToConstant: 300),
      
      hidingView.topAnchor.constraint(equalTo: view.topAnchor),
           hidingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           hidingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           hidingView.heightAnchor.constraint(equalToConstant: 300),
      
      orderChildVC.view.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -25),
      orderChildVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      orderChildVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      orderChildVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
    ])
  }

  private func setMyPlace() {
    myPlace.coordinate = CLLocationCoordinate2D(latitude: 37.541708, longitude: 127.056256)
    myPlace.title = "우리집"
    mapView.addAnnotation(myPlace)
    
    let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
    let region = MKCoordinateRegion(center: myPlace.coordinate, span: span)
    mapView.setRegion(region, animated: true)
  }
  
  
  
}
