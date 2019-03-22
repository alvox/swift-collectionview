//
//  Header.swift
//  collections
//
//  Created by alexander on 3/21/19.
//  Copyright © 2019 Alexander Popov. All rights reserved.
//

import UIKit

class Header: UICollectionReusableView {
    
    static let id = "Header"
    
    let label = UILabel()
    
    convenience init(title: String) {
        self.init()
        setup(title: title)
    }
    
    func setup(title: String) {
        
        addSubview(label)
        label.text = title
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -7)
        ])
    }
        
}
