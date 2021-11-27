//
//  CarTypesRequest.swift
//  TestApp
//
//  Created by Dani  on 16/11/2021.
//

import Foundation

struct ManufacturerArgs: PagingRequest, Codable {
    
    var page, pageSize: Int
}
