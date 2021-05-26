//
//  textVM.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 8/10/20
//

import Foundation
import RxSwift
import RxCocoa


class PhotosVM : MasterVM {
    
    // MARK: - MODEL
    var photoM  = [PhotoM] () {
        didSet {
            self.photos.accept(photoM.map{ PhotoCellVM(mItem: $0)})
        }
    }

    // MARK: - PRIVATE
    private let photos : PublishRelay<[PhotoCellVM]> = PublishRelay()
    private let isTableHidden : BehaviorRelay<Bool> = BehaviorRelay(value: true)
    
    // MARK: - PUBLIC DRIVERS
    public var hideCollection: Driver<Bool> {
        return isTableHidden
            .asDriver()
    }
    
    public var photosList : Driver<[PhotoCellVM]> {
        return photos
            .asDriver(onErrorJustReturn: [])
    }
    
    // MARK: - INIT
    override init() { }
    
    
    // MARK: - PUBLIC
    public func loadData () {
        loading.accept(true)
        repo.getRandomPhotos()
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: {
                self.isTableHidden.accept(false)
                self.loading.accept(false)
                self.photoM = $0
            }, onFailure: {
                self.isTableHidden.accept(true)
                self.loading.accept(false)
                self.error.accept($0 as! AppError)
            })
            .disposed(by: bag)
    }
    
    
}


// MARK: - CELL VM
struct PhotoCellVM {

    
    let url : URL?
    let upsplashURL : URL?
    let author : String
    let dimensions : String
        
    // MARK: - DRIVER EMPTY
    static let empty = PhotoCellVM(url: nil , upsplashURL: nil, author: ".....", dimensions: ".....")
    
    // MARK: - INIT
    init (mItem : PhotoM) {
        self.url = URL(string: mItem.downloadURL + ".jpg")
        self.upsplashURL = URL(string: mItem.unsplashUrl)
        self.author = mItem.author.capitalized
        self.dimensions = "Dimensions: \(mItem.width) x \(mItem.height)"
    }
    
    internal init(url: URL?, upsplashURL: URL?, author: String, dimensions: String) {
        self.url = url
        self.upsplashURL = upsplashURL
        self.author = author
        self.dimensions = dimensions
    }
}
