//
//  AuthService.swift
//  LoginScreens
//
//  Created by Ahir on 22/01/24.
//

import Foundation
struct AuthService {
    private let apiService: ApiService
    
    init(apiService: ApiService = ApiService.shared) {
        self.apiService = apiService
    }
    func login(with username: String, password: String, completion: @escaping ((Data?) -> ())) {
        let endPoint = "https://dummy.restapiexample.com/api/v1/employee/1"
        let parameters = ["":""
//            "username": username,
//            "password": password
        ]
        apiService.request(with: endPoint,
                           method: "GET",
                           parameters: parameters) { result in
            switch result {
            case .success(let successData):
                completion(successData)
            case .failure(_):
                completion(nil)
            }
        }
    }
    
    func signup(with username: String, password: String, completion: @escaping ((Bool) -> ())) {
        let endPoint = "https://www.yourapi.com"
        let parameters = [
            "username": username,
            "password": password
        ]
        apiService.request(with: endPoint,
                           method: "POST",
                           parameters: parameters) { result in
            switch result {
            case .success(_):
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
}
