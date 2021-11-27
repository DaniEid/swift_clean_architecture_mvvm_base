//
//  GenericResponse.swift
//  TestApp
//
//  Created by Dani  on 16/11/2021.
//

import Foundation

///will Hold the error response with suitable message
struct ErrorResponse: Encodable, Error {

    let message: String
    
    init(message: String) {
        self.message = message
    }
    
}
