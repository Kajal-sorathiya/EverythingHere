//
//  HttpUtilityRequest.swift
//  LoginScreens
//
//  Created by Ahir on 29/03/24.
//

import Foundation
struct HttpUtilityRequest {
    let url: URL
    var requestBody: Data?
    let method: HttpUtilityMethod
    
    init(url: URL, requestBody: [String: Any]? = nil, method: HttpUtilityMethod) {
        self.url = url
        self.method = method
        if let requestBody = requestBody,
           let rBody = convertDictToData(param: requestBody) {
            self.requestBody = rBody
        } else {
            self.requestBody = nil
        }
    }
    
    private func convertDictToData(param: [String: Any]) -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: param)
        } catch {
            print("Error while converting dict to data.")
        }
        return nil
    }
}

enum HttpUtilityMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}
