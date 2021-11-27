//
//  Manufacturer.swift
//  TestApp
//
//  Created by Dani  on 17/11/2021.
//

import Foundation
import Combine


/// this will be responsible for doing one task only
class FetchManufacturerUseCase: SingleUseCase {
    
    let repository: CarTypeRepository
    var pageNumber: Int

    init(repository: CarTypeRepository, pageNumber: Int) {
        self.repository = repository
        self.pageNumber = pageNumber
    }
    
    
    func start() -> Future<Response?,ErrorResponse> {
        Future { [weak self] promise in
            self?.repository.getManufacturer(page: self?.pageNumber ?? 0) { result, error in
            
                if result != nil {
                   
                    if let data = result as? CarTypesResponse {
                        var manufacturers: [ManufacturerEntity] = []
                        for (id, name) in data.wkda {
                     
                            manufacturers.append( ManufacturerEntity(id: id, name: name))
                        }
                        
                        let manufacturersEntity = ManufacturesEntity(manufacturers: manufacturers, totalPageCount: data.totalPageCount)
                        
                        promise(Result.success(manufacturersEntity))
                    }
               
                }
                else {
                    promise(Result.failure(error!))
                }
            }
        }
    }
}
