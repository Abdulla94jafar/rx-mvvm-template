//
//  TableExtension.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 8/10/20
//

import UIKit


public extension  UITableView {

    func registerCellNib(_ nibName : UITableViewCell.Type ) {
        let cellNibName = String(describing: nibName)
        register(UINib(nibName: cellNibName, bundle: .main), forCellReuseIdentifier: cellNibName)
    }
    
    func registerCellClass(_ cellClass : UITableViewCell.Type ) {
        register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
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

