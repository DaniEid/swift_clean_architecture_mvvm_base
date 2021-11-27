//
//  CarTypeUseCase.swift
//  TestApp
//
//  Created by Dani  on 17/11/2021.
//

import Foundation
import UIKit

///this will hold all the use cases that is related to this use case
class CarTypeUseCase: UseCase {
    
    var fetchManufacturer: FetchManufacturerUseCase?
    var fetchMainTypes: FetchMainTypes?
    
}
