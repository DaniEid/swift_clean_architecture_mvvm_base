//
//  MainTypeRequest.swift
//  TestApp
//
//  Created by Dani  on 18/11/2021.
//

import Foundation

struct MainTypeArgs: PagingRequest, Codable {
    
    var page, pageSize: Int
    var manufacturer: String

}
