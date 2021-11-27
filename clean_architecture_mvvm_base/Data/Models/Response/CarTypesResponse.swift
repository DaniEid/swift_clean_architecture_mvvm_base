//
//  CarTypes.swift
//  TestApp
//
//  Created by Dani  on 16/11/2021.
//

import Foundation


struct CarTypesResponse: Response {
    var page, pageSize, totalPageCount: Int
    var wkda: [String: String]
}

