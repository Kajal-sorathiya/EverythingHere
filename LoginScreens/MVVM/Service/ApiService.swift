//
//  ApiService.swift
//  LoginScreens
//
//  Created by Ahir on 22/01/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed
    case invalidData
}
struct ApiService {
    static let shared = ApiService()
    private init() {}
    
    func request(with endPoint: String,
                 method: String,
                 parameters: [String: Any]?,
                 completion: @escaping ((Result<Data, Error>) -> ())) {
        guard let url = URL(string: endPoint) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        
//        if let parameters = parameters {
//            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        }
        
        let task = URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            guard let httpRespose = urlResponse as? HTTPURLResponse, let data = data, httpRespose.statusCode == 200 else {
                completion(.failure(APIError.invalidData))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
    func secondApiService(with endpoint: String, method: String, param: [String: Any]?, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: endpoint) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        if let param = param {
            request.httpBody = try? JSONSerialization.data(withJSONObject: param)
            request.addValue("Application/json", forHTTPHeaderField: "Content-type")
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            guard let urlResponse = urlResponse as? HTTPURLResponse,
                  urlResponse.statusCode == 200,
                  let data = data else {
                completion(.failure(APIError.invalidData))
                return
            }
            completion(.success(data))
        }
        
    }
}
