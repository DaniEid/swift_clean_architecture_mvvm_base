//
//  FetchMainTypes.swift
//  TestApp
//
//  Created by Dani  on 17/11/2021.
//

import Foundation
import Combine

/// this will be responsible for doing one task only
class FetchMainTypes: SingleUseCase {
    
    let repository: CarTypeRepository
    var pageNumber: Int
    let manufacturerID: String

    init(repository: CarTypeRepository, pageNumber: Int, manufacturerID: String ) {
        self.repository = repository
        self.pageNumber = pageNumber
        self.manufacturerID = manufacturerID
    }
    
    
    func start() -> Future<Response?,ErrorResponse> {
        Future { [weak self] promise in
            self?.repository.getMainTypes(page: self?.pageNumber ?? 0, manufacturerID: self?.manufacturerID ?? "") { result, error in

                if result != nil {
                   
                    if let data = result as? CarTypesResponse {
                        var mainTypes: [MainTypeEntity] = []
                        for (_, name) in data.wkda {
                            mainTypes.append( MainTypeEntity(name: name))
                        }
                        let mainTypesEntity = MainTypesEntity(mainTypes: mainTypes, totalPageCount: data.totalPageCount)
                        
                        promise(Result.success(mainTypesEntity))
                    }
                }
                else {
                    promise(Result.failure(error!))
                }
            }
        }
    }
    
    
}
