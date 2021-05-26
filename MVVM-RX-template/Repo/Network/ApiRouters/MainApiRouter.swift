//
//  ApiRouter.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 7/3/20.
//

import Foundation
import Alamofire

enum MainApiRouter {
    case getRandomPhotos
}


extension MainApiRouter : Requestable {
    var baseUrl: String {
        return BaseUrls.picsumBURL
    }
    
    var path: String {
        switch self {
        case .getRandomPhotos  : return "/list"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getRandomPhotos  : return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getRandomPhotos  : return nil
        }
    }
    
    var bodyParameters: Parameters? {
        switch self {
        case .getRandomPhotos  : return nil
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .getRandomPhotos  : return nil
        }
    }
    
    
}
