//
//  HomeViewController.swift
//  LoginIn
//
//  Created by Jean Ricardo Cesca on 27/09/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    var homeView: HomeView?
    var homeTableViewCell: HomeTableViewCell?
    
    var usersModel: [UserModel] = [
        UserModel(name: "Jean", image: "face.smiling.fill"),
        UserModel(name: "Paula", image: "face.smiling.fill"),
        UserModel(name: "Yan", image: "face.smiling.fill"),
    ]
    
    var sportsModel: [SportModel] = [
        SportModel(name: "Rabbit", nameImage: "hare"),
        SportModel(name: "Turtle", nameImage: "tortoise"),
        SportModel(name: "Ant", nameImage: "ant"),
        SportModel(name: "Lady Bug", nameImage: "ladybug")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView?.configureTableViewDelegate(delegate: self, dataSource: self)
    }
    
    override func loadView() {
        self.homeView = HomeView()
        self.view = homeView
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersModel.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == usersModel.count {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.id, for: indexPath) as? SportTableViewCell else {
                return UITableViewCell()
            }
            cell.dataCollection(with: self.sportsModel)
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.id, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(with: usersModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
