//
//  MasterVM.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 8/10/20
//

import Foundation
import RxSwift
import RxCocoa

class MasterVM {
    
    // MARK: - PUBLIC RELAYS
    public let error : PublishRelay<AppError> = PublishRelay()
    public let loading : PublishRelay<Bool> = PublishRelay()
    
    let bag = DisposeBag()
    let repo = Repository()

    init() { }
    
}
