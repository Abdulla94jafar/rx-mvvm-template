//
//  RegistrationNP.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 7/3/20.
//

import Foundation
import Alamofire




public protocol Requestable : URLRequestConvertible {
    
    var baseUrl : String { get }
    
    var path: String { get }
    
    var method: HTTPMethod { get }
    
    var parameters : Parameters? { get }
    
    var bodyParameters : Parameters? { get }
    
    var headers: HTTPHeaders? { get }
}


extension Requestable {

    public func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        // MARK: - ADDING URL PARAMETERS
        if let parameters = self.parameters {
            let p = parameters.mapValues {"\($0)"}
            urlRequest = try URLEncodedFormParameterEncoder().encode(p, into: urlRequest)
        }
        
        // MARK: - ADDNG BODY PARAMETERS
        if let parameters = self.bodyParameters {
            let encoder = JSONEncoding.default
            urlRequest = try encoder.encode(urlRequest, with: parameters)
        }
        
        // MARK: - ADDING HEADERS
        if let headers = self.headers {
            urlRequest.headers = headers
        }
        
        NetworkLogger.log(urlRequest)
        return urlRequest
    }
}




public enum HTTPHeaderField: String {
    case authorization = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

public enum ContentType: String {
    case json = "application/json"
    case urlEncoded = "application/x-www-form-urlencoded"
}

