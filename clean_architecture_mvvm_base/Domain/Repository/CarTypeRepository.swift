//
//  CarTypeRepository.swift
//  TestApp
//
//  Created by Dani  on 17/11/2021.
//

import Foundation

// this will be our abstract class for defining car type repository
protocol CarTypeRepository {
    
    //we should add the implementation for this
    //we don't know where it's going to fetch data local or remote
    //for now we only care for remote
    func getManufacturer(page: Int, completion: @escaping (_ result: Response?, _ error: ErrorResponse?) -> Void)  
    
    func getMainTypes(page: Int, manufacturerID: String, completion: @escaping (_ result: Response?, _ error: ErrorResponse?) -> Void)
}
