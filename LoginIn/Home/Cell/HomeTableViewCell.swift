//
//  HomeTableViewCell.swift
//  LoginIn
//
//  Created by Jean Ricardo Cesca on 27/09/22.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let id: String = "HomeTableViewCell"
    
    lazy var userDetailView: UserDetailView = {
        let view = UserDetailView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(userDetailView)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(with data: UserModel) {
        userDetailView.userLabel.text = data.name
        userDetailView.userImageView.image = UIImage(systemName: data.image)
    }
    
    private func configureConstraints() {
        userDetailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
