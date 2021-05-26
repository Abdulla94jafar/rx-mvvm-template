//
//  RXExtension.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 8/16/20
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: MasterVC {
    
    
    internal var hudIsAnimating: Binder<Bool> {
        return Binder(self.base, binding: { (vc, active) in
            if active {
                vc.showHUD()
            } else {
                vc.hideHUD()
            }
        })
    }
    
    internal var showErrorAlert: Binder<AppError> {
        return Binder(self.base, binding: { (vc, appError) in
            vc.showFailureAlertWith(appError)
        })
    }
    
}


extension Reactive where Base: UIImageView {
    
    
    internal var kfBinder : Binder<URL?> {
        return Binder(self.base, binding: { (iv, url) in
    
            iv.kf.setImage(
                with: url,
                placeholder: nil,
                options: [.transition(.fade(0.4)), .processor(KFProcessor.largeImageProcessor)],
                progressBlock: nil, completionHandler: nil
            )
        })
    }
    

    
}
