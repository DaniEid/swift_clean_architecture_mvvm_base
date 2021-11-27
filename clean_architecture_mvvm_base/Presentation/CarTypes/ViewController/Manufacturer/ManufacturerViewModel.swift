//
//  CarTypeViewModel.swift
//  TestApp
//
//  Created by Dani  on 18/11/2021.
//

import Foundation
import Combine

///The view model responsible for Manufacturere view controller
class ManufacturerViewModel: BaseViewModel{
    
    var pageNumber = 0
    var apiResponse: ManufacturesEntity?
    
    var totalPages: Int {
        get {
            return apiResponse?.totalPageCount ?? 0
        }
    }
    
    var currentCount: Int {
        get {
            return apiResponse?.manufacturers.count ?? 0
        }
    }
    
    var oldCount: Int = 0
    
    
    var shouldFetchNextPage: Bool {
        get {
            return !isLoading && pageNumber < totalPages
        }
    }
    
    init() {
        let repository = CarTypeRepositoryIMPL(remote: CarTypeRemoteService())
        
        let carTypeUseCase = CarTypeUseCase()
        carTypeUseCase.fetchManufacturer = FetchManufacturerUseCase(repository: repository, pageNumber: pageNumber)
        
        super.init(useCase: carTypeUseCase)
    }
    
    init(useCase: CarTypeUseCase) {
        super.init(useCase: useCase)
    }
    
    func fetchData() -> Future<Response?, ErrorResponse>? {
        let viewModelUseCase = self.useCase as! CarTypeUseCase
        
        self.isLoading = true
        self.showError = false
        
        viewModelUseCase.fetchManufacturer?.pageNumber = pageNumber
        return viewModelUseCase.fetchManufacturer?.start()
    }
    
    
    
    ///to avoid reloading all the data
    func calculateIndexPathsToReload(from newCount: Int ) -> [IndexPath] {
        
        return PresentationHelper.calculateIndexPathsToReload(from: newCount, oldCount: oldCount, section: 0)
        
    }
    
    
    func handleResponse(response: Response) {
        if(apiResponse == nil) {
            apiResponse = response as? ManufacturesEntity
        } else {
            let manufacturerResponse =  response as! ManufacturesEntity
            
            oldCount = currentCount
            
            apiResponse?.manufacturers.append(contentsOf: manufacturerResponse.manufacturers)
            
        }
        
    }
    
    func itemName(index: Int) -> String {
        return apiResponse?.manufacturers[index].name ?? ""
    }
    
    
    func itemAt(index: Int) -> ManufacturerEntity? {
        return apiResponse?.manufacturers[index]
    }
    
}
