//
//  Repository.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 7/3/20.
//

import Foundation
import RxSwift



class Repository  {

    init () { }
    
    // add another instance for your store layer here
    let network = AlamofireServices()

    public func getRandomPhotos() -> Single<[PhotoM]> {
        network.requestDecodable(request: MainApiRouter.getRandomPhotos)
        // you can use RX operators to persist the response or to map it.
    }
    
    
}
