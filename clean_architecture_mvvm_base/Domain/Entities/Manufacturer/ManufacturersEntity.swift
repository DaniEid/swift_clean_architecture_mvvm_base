//
//  CarTypesEntity.swift
//  TestApp
//
//  Created by Dani  on 19/11/2021.
//

import Foundation

struct ManufacturesEntity:Response{
    var manufacturers: [ManufacturerEntity]
    
    var totalPageCount: Int
    
    init(manufacturers: [ManufacturerEntity], totalPageCount: Int) {
        self.manufacturers = manufacturers
        self.totalPageCount = totalPageCount
    }
}
