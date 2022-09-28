//
//  SportsCollectionViewCell.swift
//  LoginIn
//
//  Created by Jean Ricardo Cesca on 27/09/22.
//

import Foundation
import UIKit

class SportsCollectionViewCell: UICollectionViewCell {
    
    static let id = "SportsCollectionViewCell"
    
    let sportCollectionViewCellView = SportCollectionViewCellView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(sportCollectionViewCellView)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(with model: SportModel) {
        sportCollectionViewCellView.imageView.image = UIImage(systemName: model.nameImage)
        sportCollectionViewCellView.sportName.text = model.name
        
    }
    
    private func configureConstraints() {
        sportCollectionViewCellView.translatesAutoresizingMaskIntoConstraints = false
        sportCollectionViewCellView.layer.borderWidth = 3.0
        sportCollectionViewCellView.layer.borderColor = UIColor.blue.cgColor

        NSLayoutConstraint.activate([
            sportCollectionViewCellView.topAnchor.constraint(equalTo: topAnchor),
            sportCollectionViewCellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sportCollectionViewCellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            sportCollectionViewCellView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}
