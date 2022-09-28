//
//  SportTableViewCell.swift
//  LoginIn
//
//  Created by Jean Ricardo Cesca on 27/09/22.
//

import Foundation
import UIKit

class SportTableViewCell: UITableViewCell {
    
    static let id: String = "SportTableViewCell"
    var sportTableViewCellView: SportTableViewCellView = SportTableViewCellView()
    
    var sportModels: [SportModel] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(sportTableViewCellView)
        configureConstraints()
        sportTableViewCellView.setupProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func dataCollection(with model: [SportModel]) {
        self.sportModels = model
    }
    
    private func configureConstraints() {
        sportTableViewCellView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SportTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SportsCollectionViewCell.id, for: indexPath) as? SportsCollectionViewCell else {
            return UICollectionViewCell()
        }
                
        cell.setupCell(with: sportModels[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 140, height: 100)
    }

}
