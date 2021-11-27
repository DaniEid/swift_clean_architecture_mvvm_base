//
//  CarTypeRepositoryIMP.swift
//  TestApp
//
//  Created by Dani  on 17/11/2021.
//

import Foundation
import Alamofire

///Thtis class will be reponsible for implementing the Repository from the Domain Layer
final class CarTypeRepositoryIMPL {

    //this will represent the networking service for car type
    //we can have another one for local if we had local storage
    private let remoteDateSource: CarTypeDataSource
    
    init(remote: CarTypeDataSource) {
        self.remoteDateSource = remote
    }
}

extension CarTypeRepositoryIMPL: CarTypeRepository{

    
    func getManufacturer(page: Int, completion: @escaping (_ result: Response?, _ error: ErrorResponse?) -> Void)  {
        ///Here we can check for local or remote data source
        let args = ManufacturerArgs(page: page, pageSize: Constants.pageSize)
        remoteDateSource.getManufacturer(manufacturerArgs: args, completion: completion)
    }
    
    
    func getMainTypes(page: Int, manufacturerID: String, completion: @escaping (Response?, ErrorResponse?) -> Void) {
        ///Here we can check for local or remote data source
        let args = MainTypeArgs(page: page, pageSize: Constants.pageSize, manufacturer: manufacturerID)
        remoteDateSource.getMainTypes(mainTypeArgs: args, completion: completion)
    }
}
