//
//  EndPoints.swift
//  TestApp
//
//  Created by Dani  on 17/11/2021.
//

import Foundation

/// will be responsible for holding the end points name
/// also will help to separate the endpoints by its controller/feature
struct EndPoints {
    static let endPointVersion = "/v3"
    
 
    ///Holdinh all APIs for car types
    struct CartTypes {
        ///we should add the name of the controller here
        ///for now we don't have controller name
        static let endPointController = "/"
        
        static var manufacturer: String { get {  return "\(endPointVersion)\(endPointController)17448d3b-d6cf-40f0-a580-dc000247f4ab" }  }
        
        static var mainTypes: String { get {  return "\(endPointVersion)\(endPointController)b7915703-4927-4336-8e1a-8a596b2db5f1" }  }
    }
}
