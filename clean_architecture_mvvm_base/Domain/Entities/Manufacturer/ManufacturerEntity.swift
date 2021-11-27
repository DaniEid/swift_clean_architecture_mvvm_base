//
//  CarTypeEntity.swift
//  TestApp
//
//  Created by Dani  on 19/11/2021.
//

import Foundation

struct ManufacturerEntity:Codable {
    let id: String
    let name: String
    
    init(id: String, name:String){
        self.id = id
        self.name = name
    }
}
