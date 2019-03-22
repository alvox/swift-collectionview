//
//  Wrapper.swift
//  collections
//
//  Created by alexander on 3/21/19.
//  Copyright © 2019 Alexander Popov. All rights reserved.
//

import UIKit

class Wrapper: UIViewController {
    
    private var collection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collection = UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
        collection.register(ItemCell.self, forCellWithReuseIdentifier: ItemCell.id)
        collection.register(Embedded.self, forCellWithReuseIdentifier: Embedded.id)
        collection.register(Header.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: Header.id)
        view.addSubview(collection)
    }

}

extension Wrapper: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return ELEMENTS.isEmpty ? 0 : 1
        default:
            return ITEMS.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Embedded.id, for: indexPath) as! Embedded
            cell.setup()
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.id, for: indexPath) as! ItemCell
        cell.setup(title: ITEMS[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            if ELEMENTS.isEmpty {
                return CGSize.zero
            }
            return CGSize(width: collectionView.bounds.width, height: 150)
        }
        return CGSize(width: collectionView.bounds.width - 40, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: Header.id,
            for: indexPath) as? Header else { return UICollectionReusableView() }
        if indexPath.section == 0 {
            header.setup(title: "Header 1")
        } else {
            header.setup(title: "Header 2")
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 && ELEMENTS.isEmpty {
            return CGSize.zero
        }
        return CGSize(width: collectionView.bounds.width, height: 60)
    }
    
}
