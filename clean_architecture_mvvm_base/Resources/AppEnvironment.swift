//
//  AppEnvironment.swift
//  TestApp
//
//  Created by Dani  on 16/11/2021.
//

import Foundation

// MARK: - App Environment class containing the current evn and helpers checks 
public class AppEnvironment {
    
    public static var current: Environment {
  
        let appSchema = Bundle.main.infoDictionary?["App Environment"] as? String
        switch appSchema {
        case ".test":
            return .test
        default:// Release
            return .live
        }
    }
        
    public static var isLive: Bool {
        
        AppEnvironment.current == Environment.live
    }
    
    public static var isTest: Bool {
        
        AppEnvironment.current == Environment.test
    }
    
}
