//
//  MainTypeEntity.swift
//  TestApp
//
//  Created by Dani  on 20/11/2021.
//

import Foundation


struct MainTypeEntity:Codable {

    let name: String
    
    init(name:String){
        self.name = name
    }
}
