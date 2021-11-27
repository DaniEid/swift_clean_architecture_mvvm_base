//
//  Services.swift
//  TestApp
//
//  Created by Dani  on 16/11/2021.
//

import Foundation

// MARK: - Networking call within this class will happen
struct CarTypeRemoteService: CarTypeDataSource {
  
    func getMainTypes(mainTypeArgs: MainTypeArgs, completion: @escaping (Response?, ErrorResponse?) -> Void) {
        
        ///check the args if it's valid
        guard let params = mainTypeArgs.asDictionary() else { completion(nil, ErrorResponse(message: "args_error".localized))
            return
        }
       
        /// here we create the event that represent the endpoint
        let event =  API(path: EndPoints.CartTypes.mainTypes ,
                         method: .get,
                         queryParameters: params
       )
       
       ///here we call the request with our type and completion handler
       BaseNetworking.shared.request(CarTypesResponse.self,
                                             endPoint:event,completion: completion);
    }
    
  
    func getManufacturer(manufacturerArgs: ManufacturerArgs,completion: @escaping (_ result: CarTypesResponse?, _ error: ErrorResponse?) -> Void) {
        
         ///check the args if it's valid
         guard let params = manufacturerArgs.asDictionary() else { completion(nil, ErrorResponse(message: "args_error".localized))
             return
         }
        
         /// here we create the event that represent the endpoint
         let event =  API(path: EndPoints.CartTypes.manufacturer ,
                          method: .get,
                          queryParameters: params
        )
        
        ///here we call the request with our type and completion handler
        BaseNetworking.shared.request(CarTypesResponse.self,
                                              endPoint:event,completion: completion);
        
    }
    
    
    
}
