//
//  MainTypesViewModel.swift
//  TestApp
//
//  Created by Dani  on 20/11/2021.
//

import Foundation
import Combine

///The view model responsible for car main types view controller
class MainTypesViewModel: BaseViewModel{
    
    var pageNumber = 0
    var apiResponse: MainTypesEntity?
    var manufacturer: ManufacturerEntity?
    
    var totalPages: Int {
        get {
            return apiResponse?.totalPageCount ?? 0
        }
    }
    
    var currentCount: Int {
        get {
            return apiResponse?.mainTypes.count ?? 0
        }
    }
    
    var oldCount: Int = 0
    
    
    var shouldFetchNextPage: Bool {
        get {
            return !isLoading && pageNumber < totalPages
        }
    }
    
    init(manufacturer: ManufacturerEntity) {
        self.manufacturer = manufacturer
        let repository = CarTypeRepositoryIMPL(remote: CarTypeRemoteService())
        
        let carTypeUseCase = CarTypeUseCase()
        ///we will force unrwape the id beacuse it's impossible not to have value
        carTypeUseCase.fetchMainTypes = FetchMainTypes(repository: repository,pageNumber: pageNumber, manufacturerID: manufacturer.id)
        
        super.init(useCase: carTypeUseCase)
    }
    
    init(useCase: CarTypeUseCase) {
        super.init(useCase: useCase)
    }
    
    
    
    func fetchData() -> Future<Response?, ErrorResponse>? {
        let viewModelUseCase = self.useCase as! CarTypeUseCase
        
        self.isLoading = true
        self.showError = false
        
        viewModelUseCase.fetchMainTypes?.pageNumber = pageNumber
        return viewModelUseCase.fetchMainTypes?.start()
    }
    
    
    
    ///to avoid reloading all the data
    func calculateIndexPathsToReload(from newCount: Int ) -> [IndexPath] {
        return PresentationHelper.calculateIndexPathsToReload(from: newCount, oldCount: oldCount, section: 0)
    }
    
    
    func handleResponse(response: Response) {
        if(apiResponse == nil) {
            apiResponse = response as? MainTypesEntity
        } else {
            let mainTypeResponse =  response as! MainTypesEntity
            oldCount = currentCount
            apiResponse?.mainTypes.append(contentsOf: mainTypeResponse.mainTypes)
        }
    }
    
    func itemName(index: Int) -> String {
        return apiResponse?.mainTypes[index].name ?? ""
    }
    
    func itemAt(index: Int) -> MainTypeEntity? {
        return apiResponse?.mainTypes[index]
    }
    
}
