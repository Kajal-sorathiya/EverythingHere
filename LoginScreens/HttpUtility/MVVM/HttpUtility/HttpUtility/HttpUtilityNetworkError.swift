//
//  HttpUtilityNetworkError.swift
//  LoginScreens
//
//  Created by Ahir on 29/03/24.
//

import Foundation

struct HttpUtilityNetworkError: Error {
    let url: URL
    let httpRequest: String?
    let serverResponse: String?
    let httpStatusCode: Int?
    let reason: String?
    
    init(url: URL, httpRequest: Data?, serverResponse: Data?, httpStatusCode: Int?, reason: String?) {
        self.url = url
        self.httpRequest = httpRequest != nil ? String(data: httpRequest!, encoding: .utf8) : nil
        self.serverResponse = serverResponse != nil ? String(data: serverResponse!, encoding: .utf8) : nil
        self.httpStatusCode = httpStatusCode
        self.reason = reason
    }
}
