//
//  HttpUtilityManager.swift
//  LoginScreens
//
//  Created by Ahir on 29/03/24.
//

import Foundation

class HttpUtilityManager {
    private init() {}
    static let shared = HttpUtilityManager()
    let authenticationToken: String? = nil
    let customDecoder: JSONDecoder? = nil
    typealias completion<T: Decodable> = ((Result<T, HttpUtilityNetworkError>) -> Void)
    
    public func makeApiCall<T: Decodable>(with httpRequest: HttpUtilityRequest, responseType: T.Type, completion: @escaping completion<T>) {
        switch httpRequest.method {
        case .get:
            getApi(with: httpRequest, responseType: responseType, completion: completion)
        case .post:
            postApi(with: httpRequest, responseType: responseType, completion: completion)
        case .delete:
            deleteApi(with: httpRequest, responseType: responseType, completion: completion)
        case .put:
            putApi(with: httpRequest, responseType: responseType, completion: completion)
        }
    }
    
    // Get api
    private func getApi<T: Decodable>(with httpRequest: HttpUtilityRequest, responseType: T.Type, completion: @escaping completion<T>) {
        var urlRequest = createUrlRequest(with: httpRequest.url)
        urlRequest.httpMethod = httpRequest.method.rawValue
        
        performServiceCall(with: urlRequest,
                           responseType: T.self,
                           completion: completion)
    }
    
    // Post request
    private func postApi<T: Decodable>(with httpRequest: HttpUtilityRequest, responseType: T.Type, completion: @escaping completion<T>) {
        var urlRequest = createUrlRequest(with: httpRequest.url)
        urlRequest.httpMethod = httpRequest.method.rawValue
        urlRequest.httpBody = httpRequest.requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        performServiceCall(with: urlRequest,
                           responseType: T.self,
                           completion: completion)
    }
    
    // Put Api
    private func putApi<T: Decodable>(with httpRequest: HttpUtilityRequest, responseType: T.Type, completion: @escaping completion<T>) {
        var urlRequest = createUrlRequest(with: httpRequest.url)
        urlRequest.httpMethod = httpRequest.method.rawValue
        
        performServiceCall(with: urlRequest,
                           responseType: T.self,
                           completion: completion)
    }
    
    // Delete Api
    private func deleteApi<T: Decodable>(with httpRequest: HttpUtilityRequest, responseType: T.Type, completion: @escaping completion<T>) {
        var urlRequest = createUrlRequest(with: httpRequest.url)
        urlRequest.httpMethod = httpRequest.method.rawValue
        
        performServiceCall(with: urlRequest,
                           responseType: T.self,
                           completion: completion)
    }
    
    // Create url request
    private func createUrlRequest(with url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        if authenticationToken != nil {
            urlRequest.addValue(authenticationToken!, forHTTPHeaderField: "authorization")
        }
        return urlRequest
    }
    
    // Perfom service callin'
    private func performServiceCall<T: Decodable>(with urlRequest: URLRequest, responseType: T.Type, completion: @escaping completion<T>) {
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode
            if error == nil, data != nil, data?.count ?? 0 > 0 {
                let decodeResponse = self.decodeResponse(responseType: responseType, data: data!)
                if decodeResponse !=  nil {
                    completion(.success(decodeResponse!))
                } else {
                    completion(.failure(HttpUtilityNetworkError(url: urlRequest.url!,
                                                                httpRequest: urlRequest.httpBody,
                                                                serverResponse: data,
                                                                httpStatusCode: statusCode,
                                                                reason: "")))
                }
            } else {
                completion(.failure(HttpUtilityNetworkError(url: urlRequest.url!,
                                                            httpRequest: urlRequest.httpBody,
                                                            serverResponse: data,
                                                            httpStatusCode: statusCode,
                                                            reason: "")))
            }
        }.resume()
    }
    
    // Decode response
    private func decodeResponse<T: Decodable>(responseType: T.Type, data: Data) -> T? {
        let decoder = createDecoder()
        do {
            print(String(data: data, encoding: .utf8))
            return try decoder.decode(responseType, from: data)
        } catch let error {
            print("Error while decoding \(T.self). Error: \(error.localizedDescription)")
        }
        return nil
    }
    
    // Create decoder
    private func createDecoder() -> JSONDecoder {
        let decoder = customDecoder != nil ? customDecoder! : JSONDecoder()
        if customDecoder == nil {
            decoder.dataDecodingStrategy = .base64
        }
        return decoder
    }
}
