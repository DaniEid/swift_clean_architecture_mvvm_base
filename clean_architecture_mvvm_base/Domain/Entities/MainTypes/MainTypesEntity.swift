//
//  MainTypesEntity.swift
//  TestApp
//
//  Created by Dani  on 20/11/2021.
//

import Foundation

struct MainTypesEntity:Response{
    var mainTypes: [MainTypeEntity]
    
    var totalPageCount: Int
    
    init(mainTypes: [MainTypeEntity], totalPageCount: Int) {
        self.mainTypes = mainTypes
        self.totalPageCount = totalPageCount
    }
}
