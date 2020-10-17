//
//  ReserveCompleteTableViewCell.swift
//  Eco-Friends
//
//  Created by ㅇ오ㅇ on 2020/07/17.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ReserveCompleteChildViewController: UIViewController {
  // MARK:- Properties
  let tableV = UITableView()
  // MARK:- viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setConstraint()
  }
  // MARK:- setUI
  func setUI() {
    view.layer.cornerRadius = 20
    view.layer.borderColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 0.3)
    view.layer.borderWidth = 1
    
    view.addSubview(tableV)
    tableV.backgroundColor = .white
    tableV.layer.cornerRadius = 10
    tableV.dataSource = self
    tableV.delegate = self
    tableV.register(ReserveCompleteChildTableViewCell.self, forCellReuseIdentifier: ReserveCompleteChildTableViewCell.identifier)
    tableV.register(ReserveCompleteChild2TableViewCell.self, forCellReuseIdentifier: ReserveCompleteChild2TableViewCell.identifier)
    tableV.register(ReserveCompleteChild3TableViewCell.self, forCellReuseIdentifier: ReserveCompleteChild3TableViewCell.identifier)
  }
  // MARK:- setConstraint
  func setConstraint() {
    tableV.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableV.topAnchor.constraint(equalTo: view.topAnchor),
      tableV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableV.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}
// MARK:- tableViewDataSource
extension ReserveCompleteChildViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    3
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 1
    } else if section == 1{
      return 1
    } else {
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: ReserveCompleteChildTableViewCell.identifier, for: indexPath) as! ReserveCompleteChildTableViewCell
      
      return cell
      
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: ReserveCompleteChild2TableViewCell.identifier, for: indexPath) as! ReserveCompleteChild2TableViewCell

      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: ReserveCompleteChild3TableViewCell.identifier, for: indexPath) as! ReserveCompleteChild3TableViewCell
      
      return cell
    }
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 {
        return 80
    } else if indexPath.section == 1{
        return 120
      } else {
        return 80
      }
  }
}

extension ReserveCompleteChildViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
  }
}
