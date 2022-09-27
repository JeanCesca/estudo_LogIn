//
//  UserDetailTableViewCell.swift
//  LoginIn
//
//  Created by Jean Ricardo Cesca on 27/09/22.
//

import Foundation
import UIKit

class UserDetailView: UIView {
    
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGreen
        return imageView
    }()
    
    lazy var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(userImageView)
        addSubview(userLabel)
        setupUserImageViewConstraints()
        setupUserLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func setupUserImageViewConstraints() {
        userImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(10)
            make.height.width.equalTo(65)
        }
    }
    
    func setupUserLabelConstraints() {
        userLabel.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView.snp.centerY)
            make.leading.equalTo(userImageView.snp.trailing).offset(20)
        }
    }
}
