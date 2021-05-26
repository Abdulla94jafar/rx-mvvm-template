//
//  AppError.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 7/3/20.
//

import Foundation
import Alamofire

enum AppError: String, Error {
    case failure = "Something went wrong, try again later."
    case networkFailure = "Check your internet connection and try again later."
    case unAuthorized = "Your account is active on another device."
}

extension AppError : LocalizedError {
    public var errorDescription: String? {
        return rawValue.localize()
    }
}


struct AppErrorHelper {

    private static let serverErrorMessage :[String : AppError] = [
        "OLD_TOKEN"     : .unAuthorized,
        "NO_SUCH_USER"  : .unAuthorized,
    ]
    
    // you can use the serverErrorMessage to parse the error here,
    static func errorForResponse (_ response : AFDataResponse<Data> ) -> AppError {
        let result = response.response
        switch result?.statusCode {
        case nil: return .networkFailure
        case 401: return .unAuthorized
        default : return .failure
        }
    }
}
