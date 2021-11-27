//
//  Endpoint.swift
//  TestApp
//
//  Created by Dani  on 16/11/2021.
//

import Foundation
import Alamofire


// MARK: - API class will help to define the APIs in the remote networking when calling from the server
public class API{
    
    public let path: String
    public let method: HTTPMethod
    public let headerParamaters: [String: String]
    public let queryParameters: [String: Any]
    public let bodyParamaters: [String: Any]
    public let bodyEncoding: ParameterEncoding
   
    init(path: String,
         method: HTTPMethod,
         headerParamaters: [String: String] = [:],
         queryParameters: [String: Any] = [:],
         bodyParamatersEncodable: Encodable? = nil,
         bodyParamaters: [String: Any] = [:],
         bodyEncoding: ParameterEncoding = URLEncoding.default) {
        self.path = path
        self.method = method
        self.headerParamaters = headerParamaters
        self.queryParameters = queryParameters
        self.bodyParamaters = bodyParamaters
        self.bodyEncoding = bodyEncoding
   
    }
}
