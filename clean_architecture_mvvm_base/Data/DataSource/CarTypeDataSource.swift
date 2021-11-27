//
//  CarTypeDataSource.swift
//  TestApp
//
//  Created by Dani  on 17/11/2021.
//

import Foundation
import Alamofire

///This will be our generic data source
///each data source for car type should implement this data source and fulfill its functions implementation
protocol CarTypeDataSource {
 
    func getManufacturer(manufacturerArgs: ManufacturerArgs, completion: @escaping (_ result: CarTypesResponse?, _ error: ErrorResponse?) -> Void)
    
    func getMainTypes(mainTypeArgs: MainTypeArgs, completion: @escaping (Response?, ErrorResponse?) -> Void)
}
