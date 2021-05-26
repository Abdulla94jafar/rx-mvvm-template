//
//  CollectionExtension.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 8/16/20
//

import UIKit



public extension UICollectionView {

    func registerCellNib(_ nibName : UICollectionViewCell.Type ) {
        let cellNibName = String(describing: nibName)
        register(UINib(nibName: cellNibName, bundle: .main), forCellWithReuseIdentifier: cellNibName)
    }
    
    func registerCellClass(_ cellClass : UICollectionViewCell.Type ) {
        register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
    }
    
    
    func hide () {
        isHidden = true
    }
    
    func show () {
        isHidden = false
    }
    
    
    func hideScrollIndicators() {
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    func showAndReload () {
        isHidden = false
        reloadData()
    }

}
