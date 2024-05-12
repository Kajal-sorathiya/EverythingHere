//
//  LoginViewModel.swift
//  LoginScreens
//
//  Created by Ahir on 22/01/24.
//

import Foundation
struct LoginViewModel {
    let authService: AuthService = AuthService()
    func login(username: String, password: String, completion: @escaping (LoginEmployeeResponse?) -> ()) {
        guard let url = URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/User/Login") else {
            completion(nil)
            return
        }
        let param = ["UserEmail": username,
                     "UserPassword": password]
        let request = HttpUtilityRequest(url: url, requestBody: param, method: .post)
        HttpUtilityManager.shared.makeApiCall(with: request,
                                                responseType: LoginEmployeeResponse.self) { result in
            switch result {
            case .success(let employeeDataResponse):
                completion(employeeDataResponse)
            case .failure(let error):
                print(error.reason)
                completion(nil)
            }
        }
        
//        authService.login(with: username, password: password) { employeeData in
//            guard let employeeData = employeeData else {
//                print("Invalid employee data")
//                return
//            }
//            do {
//                let employeeData = try JSONDecoder().decode(EmployeeData.self, from: employeeData)
//                completion(employeeData)
//            } catch {
//                completion(nil)
//            }
//        }
    }
}
struct ConvertToJSON {
    static func convertToJson(data: Data) -> Data? {
        do {
            let json = try JSONSerialization.jsonObject(with: data)
            return data
        } catch {
            print("Invalid json.")
        }
        return nil
    }
}
struct EmployeeDataResponse: Codable {
    let status: String?
    let message: String?
    let employeeData: EmployeeData?
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case employeeData = "data"
    }
}

struct EmployeeData: Codable {
    let id: Int?
    let name: String?
    let salary: Double?
    let age: Int?
    let profileImg: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "employee_name"
        case salary = "employee_salary"
        case age = "employee_age"
        case profileImg = "profileImg"
    }
}

struct LoginEmployeeResponse: Codable {
    let errorMsg: String?
    let employeeData: LoginEmployeeData?
    
    enum CodingKeys: String, CodingKey {
        case errorMsg = "errorMessage"
        case employeeData = "data"
    }
}

struct LoginEmployeeData: Codable {
    let name: String?
    let id: Int?
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "userName"
        case id = "userId"
        case email
    }
}
