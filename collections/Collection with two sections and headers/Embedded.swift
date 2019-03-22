//
//  Embedded.swift
//  collections
//
//  Created by alexander on 3/21/19.
//  Copyright © 2019 Alexander Popov. All rights reserved.
//

import UIKit

class Embedded: UICollectionViewCell {
    
    static let id = "Embedded"
    
    private var collection: UICollectionView!
    
    func setup() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collection = UICollectionView(frame: frame, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
        collection.register(ElementCell.self, forCellWithReuseIdentifier: ElementCell.id)
        addSubview(collection)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collection.topAnchor.constraint(equalTo: self.topAnchor),
            collection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}

extension Embedded: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ELEMENTS.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ElementCell.id, for: indexPath) as! ElementCell
        cell.setup(title: ELEMENTS[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
}
