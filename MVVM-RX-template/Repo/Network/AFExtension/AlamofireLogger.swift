//
//  AlamofireLogger.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 9/29/20.
//

import Foundation
import Alamofire

class NetworkLogger {
    
    
    private let encoder = JSONEncoder()
    

    static func log(_ request : URLRequest?) {
        guard let request = request else { return }
        print("\n======================= OUTGOING REQUEST =================== \n ")
        defer { print(" \n======================= REQUEST END ======================= \n") }
        let urlAsString = request.url?.absoluteString ?? ""
        let urlComponents = NSURLComponents(string: urlAsString)
        let method = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
        let path = "\(urlComponents?.path ?? "")"
        let query = "\(urlComponents?.query ?? "")"
        var requestLogOutput = """
                        URL:\(urlAsString)
                        METHOD:\(method)
                        PATH:\(path)
                        QUERY:\(query) \n
                        """
        
        requestLogOutput += "\nHEADERS: \n"
        for (key,value) in request.allHTTPHeaderFields ?? [:] {
            requestLogOutput += "\(key): \(value) \n"
        }
        requestLogOutput += "\nBODY: \n"
        if let body = request.httpBody {
            requestLogOutput += "\n \(NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "")"
        }
        print(requestLogOutput)
    }

    

    
    
    static func logResponse (_ dataResponse : AFDataResponse<Data>)  {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let response = dataResponse.response else { return }
        print("\n======================= INCOMING RESPONSE =================== \n")
        defer { print("\n=======================  RESPONSE END ======================= \n") }
        let responseOutput = """
                STATUS CODE:\(response.statusCode)
                AF ERROR:\(String(describing: dataResponse.error))
                """
        print(responseOutput)
        
        guard let data = try? dataResponse.result.get() else { return }
        let jsonResponse = String(data: data, encoding: .utf8) ?? ""
        var decodableOutput = "\n \nDECODABLE RESPONSE:"
        decodableOutput += jsonResponse
        print(decodableOutput)
    }
}
