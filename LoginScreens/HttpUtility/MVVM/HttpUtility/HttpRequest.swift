//
//  HttpRequest.swift
//  LoginScreens
//
//  Created by Ahir on 19/03/24.
//

import Foundation

struct HttpRequest {
    var url: URL
    var requestBody: Data?
    var method: HttpMethods
    
    init(url: URL, requestBody: Data? = nil, method: HttpMethods) {
        self.url = url
        self.requestBody = requestBody
        self.method = method
    }
}
