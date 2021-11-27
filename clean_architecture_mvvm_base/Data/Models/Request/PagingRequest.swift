//
//  PagingRequest.swift
//  TestApp
//
//  Created by Dani  on 18/11/2021.
//

import Foundation

protocol PagingRequest: Codable {
    
    var page: Int { get set}
    var pageSize: Int { get set}
    

}
