//
//  DetailsVM.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 8/10/20
//

import Foundation
import RxSwift
import RxCocoa

class DetailsVM : MasterVM {
    
    
    
    // MARK: - MODEL
    public var photoM : PhotoM! {
        didSet {
            photo.accept(PhotoCellVM(mItem: photoM))
        }
    }

    // MARK: - PRIVATE
    private var photo = PublishRelay<PhotoCellVM>()

    // MARK: - PUBLIC DRIVERS
    public var authorName : Driver<String> {
        return
            photo
            .map {$0.author}
            .asDriver(onErrorJustReturn: "....." )
    }
    
    public var dimension  : Driver<String> {
        return
            photo
            .map {$0.dimensions}
            .asDriver(onErrorJustReturn: "....." )
    }
    
    public var photoUrl : Driver<URL?> {
        return
            photo
            .map {$0.url}
            .asDriver(onErrorJustReturn: nil )
    }
    
    // MARK: - INIT
    override init() {
        super.init()
        
    }
    
}
