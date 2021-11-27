//
//  BaseNetworking.swift
//  TestApp
//
//  Created by Dani  on 16/11/2021.
//

import Foundation
import Alamofire
import Combine

// MARK: - Generic base networking class that will send request to the server and parse the response
class BaseNetworking {
    
    // MARK: Shared Instance
    public static let shared: BaseNetworking = BaseNetworking()
    
    
    ///To handle API calls and return the response
    func request<T: Codable>(_ t: T.Type,endPoint: API, completion: @escaping (_ result: T?, _ error: ErrorResponse?) -> Void)  {
        
        let url = buildRequestURL(endPoint: endPoint)
        
        if(url != nil) {
            ///herer we will call our API
            ///if it's sucess then return the object after parsing
            ///if it's failure then return error object
            AF.request(url!,
                       method: endPoint.method,
                       parameters: endPoint.bodyParamaters,
                       encoding: endPoint.bodyEncoding
            ).validate().responseDecodable(of: T.self)
            { (response) in
                
                switch response.result {
                case .success(_):
                    guard let response = response.value else
                    {
                        completion(nil, ErrorResponse(message: "parsing_error".localized))
                        return
                    }
                    print(response)
                    completion(response, nil)
               
                case .failure(_):
                    completion(nil, ErrorResponse(message: "server_error".localized))

                }
            }
            
        }else {
            completion(nil, ErrorResponse(message: "url_error".localized))
        }


    }
    
    
    /// in order to handle the get request with any query parameters
    private func buildRequestURL(endPoint: API) -> URL? {
//        var queryDictionary = endPoint.queryParameters
        
        let env = AppEnvironment.current
        
        
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = env.baseURL
        components.path = endPoint.path
        
        ///if we have any query parameters we should add them here
//        components.queryItems = queryDictionary.map {
//            URLQueryItem(name: $0, value: "\($1)")
//        }
        return components.url
    }
    
}

