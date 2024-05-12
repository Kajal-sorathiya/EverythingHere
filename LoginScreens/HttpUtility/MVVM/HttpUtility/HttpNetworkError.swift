//
//  HttpNetworkError.swift
//  LoginScreens
//
//  Created by Ahir on 19/03/24.
//

import Foundation

struct HttpNetworkError: Error {
    var reason: String?
    var requestUrl: URL?
    var requestBody: String?
    var httpStatusCode: Int?
    var serverResponse: String?
    
    init(withServerResponse response: Data?, forRequestUrl url: URL?, forRequestBody body: Data?, forHttpStatusCode code: Int?, forReason reason: String?) {
        serverResponse = response != nil ? String(data: response!, encoding: .utf8) : nil
        requestUrl = url
        requestBody = body != nil ? String(data: body!, encoding: .utf8) : nil
        httpStatusCode = code
        self.reason = reason
    }
}
