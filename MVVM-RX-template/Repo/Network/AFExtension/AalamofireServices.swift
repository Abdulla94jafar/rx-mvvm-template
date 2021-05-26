//
//  AalamofireServices.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 7/3/20.
//
import Foundation
import Alamofire
import RxSwift

public final class AlamofireServices {
  
    init() { }

    private let jsonDecoder = JSONDecoder()
    
    public func requestDecodable<T: Codable> (request : Requestable) -> Single<T>  {
        return Single.create { observer in
            AF.request(request)
                .validate(statusCode: 200..<299)
                .responseData { (response) in
                    NetworkLogger.logResponse(response)
                    let response = response
                    switch response.result {
                    case let .success(data):
                    do {
                        observer(.success(try self.jsonDecoder.decode(T.self, from: data)))
                    } catch {
                        observer(.failure(AppError.failure))
                    }
                    case .failure:
                        observer(.failure(AppErrorHelper.errorForResponse(response)))
                    }
                }
                return Disposables.create()
            }
    }

}





