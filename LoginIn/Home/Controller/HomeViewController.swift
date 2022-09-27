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
    
    var user: [UserModel] = [
        UserModel(name: "Jean", image: "face.smiling.fill"),
        UserModel(name: "Paula", image: "face.smiling.fill"),
        UserModel(name: "Yan", image: "face.smiling.fill"),
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
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.id, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(with: user[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}
