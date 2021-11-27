//
//  UseCase.swift
//  TestApp
//
//  Created by Dani  on 17/11/2021.
//

import Foundation
import Combine

///Abstraction layer to represent the top usecase for feature
protocol UseCase {
    
}


///this will be as our base use case for having all use cases fetch result function
protocol SingleUseCase{
    func start() -> Future<Response?,ErrorResponse>
}


