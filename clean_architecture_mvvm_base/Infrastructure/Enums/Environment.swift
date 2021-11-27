//
//  Environment.swift
//  TestApp
//
//  Created by Dani  on 16/11/2021.
//
import Foundation

//This enum will be responsbile for shared info based on the scheme that we have
// shared info can be:
//    API keys
//    URL
//    Third parties Keys
public enum Environment {
    case test
    case live
    
    /// Application Base URL
    var baseURL: String {
        switch self {
        case .test:
            return "run.mocky.io"
        case .live:
            //for now we don't have any live url
            return "run.mocky.io"
       
        }
    }
    
}

