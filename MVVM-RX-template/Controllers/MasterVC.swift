//
//  MasterVC.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 8/10/20
//


import UIKit
import SnapKit
import NVActivityIndicatorView
import RxSwift
import RxCocoa


class MasterVC : UIViewController {
    
    // MARK: - VARS
    let hud = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 70, height: 70) , type: .ballPulse, color: .black, padding: 0)
    let bag = DisposeBag()
    
    // MARK: - LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    // MARK: - PUBLIC
    public func setupViews () {
        setupHUD()
        
    }
    

    public func showHUD () {
        hud.isHidden = false
        hud.startAnimating()
    }
    
    public func hideHUD () {
        hud.isHidden = true
        hud.stopAnimating()
    }
    
    
    // MARK: - PRIVATE
    private func setupHUD() {
        self.view.addSubview(hud)
        hud.snp.makeConstraints {
            $0.size.equalTo(70)
            $0.center.equalToSuperview()
        }
    }

}


