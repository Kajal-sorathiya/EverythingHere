//
//  HttpUtility.swift
//  LoginScreens
//
//  Created by Ahir on 19/03/24.
//

import Foundation

class HttpUtility {
    let shared = HttpUtility()
    var customDecoder: JSONDecoder? = nil
    var authenticationToken: String? = nil
    private init() {}
    
    static func requestL<T: Decodable>(request: HttpRequest, responseType: T.Type, completionHandler: @escaping ((Result<T, HttpNetworkError>) -> Void)) {
        switch request.method {
        case .get:
            break
        case .post:
            break
        case .put:
            break
        case .delete:
            break
        }
    }
    
    // MARK: Get request
    func getApi<T: Decodable>(_ url: URL, responseType: T.Type, completion: @escaping ((Result<T?, HttpNetworkError>) -> Void)) {
        var urlRequest = createRequest(requestUrl: url)
        urlRequest.httpMethod = HttpMethods.get.rawValue
        
        performNetworkCall(requestUrl: urlRequest,
                           responseType: T.self,
                           completion: completion)
    }
    
    // MARK: Post request
    func postApi<T: Decodable>(_ request: HttpRequest, responseType: T.Type, completion: @escaping ((Result<T?, HttpNetworkError>) -> Void)) {
        var urlRequest = createRequest(requestUrl: request.url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        performNetworkCall(requestUrl: urlRequest,
                           responseType: T.self,
                           completion: completion)
    }
    
    // MARK: Put request
    func putApi<T: Decodable>(_ url: URL, responseType: T.Type, completion: @escaping ((Result<T?, HttpNetworkError>)) -> Void) {
        var urlRequest = createRequest(requestUrl: url)
        urlRequest.httpMethod = HttpMethods.put.rawValue
        
        performNetworkCall(requestUrl: urlRequest,
                           responseType: T.self,
                           completion: completion)
    }
    
    // MARK: Delete request
    func deleteApi<T: Decodable>(_ url: URL, responseType: T.Type, completion: @escaping ((Result<T?, HttpNetworkError>) -> Void)) {
        var requestUrl = createRequest(requestUrl: url)
        requestUrl.httpMethod = HttpMethods.delete.rawValue
        
        performNetworkCall(requestUrl: requestUrl,
                           responseType: T.self,
                           completion: completion)
    }
    
    // MARK: Perform Network Call
    private func performNetworkCall<T: Decodable>(requestUrl: URLRequest, responseType: T.Type, completion: @escaping ((Result<T?, HttpNetworkError>) -> (Void))) {
        URLSession.shared.dataTask(with: requestUrl) { data, urlResponse, error in
            let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode
            if error == nil, data != nil, data?.count ?? 0 > 0 {
                let response = self.decodeResponse(data: data!, responseType: responseType)
                if response == nil {
                    completion(.failure(HttpNetworkError(withServerResponse: data,
                                                         forRequestUrl: requestUrl.url,
                                                         forRequestBody: requestUrl.httpBody,
                                                         forHttpStatusCode: statusCode,
                                                         forReason: "")))
                } else {
                    completion(.success(response!))
                }
            } else {
                completion(.failure(HttpNetworkError(withServerResponse: data,
                                                     forRequestUrl: requestUrl.url,
                                                     forRequestBody: requestUrl.httpBody,
                                                     forHttpStatusCode: statusCode,
                                                     forReason: error?.localizedDescription)))
            }
        }.resume()
    }
    
    private func createRequest(requestUrl: URL) -> URLRequest {
        var urlRequest = URLRequest(url: requestUrl)
        if authenticationToken != nil {
            urlRequest.setValue(authenticationToken, forHTTPHeaderField: "authorization")
        }
        return urlRequest
    }
    
    private func createJsonDecoder() -> JSONDecoder {
        let decoder = customDecoder != nil ? customDecoder! : JSONDecoder()
        if customDecoder == nil {
            decoder.dataDecodingStrategy = .base64
        }
        return decoder
    }
    
    private func decodeResponse<T: Decodable>(data: Data, responseType: T.Type) -> T? {
        let decoder = createJsonDecoder()
        do {
            return try decoder.decode(responseType, from: data)
        } catch let error {
            print("Error while decoding \(T.self) \(error ).")
        }
        return nil
    }
}
