//
//  ItemCell.swift
//  collections
//
//  Created by alexander on 3/21/19.
//  Copyright © 2019 Alexander Popov. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    static let id = "ItemCell"
    
    let label = UILabel()
    
    convenience init(title: String) {
        self.init()
        setup(title: title)
    }
    
    func setup(title: String) {
        backgroundColor = .blue
        layer.cornerRadius = 2
        
        contentView.addSubview(label)
        label.text = title
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

}
