//
//  BaseViewController.swift
//  TestApp
//
//  Created by Dani  on 18/11/2021.
//

import Foundation
import UIKit


protocol BaseViewModelProtocol {
    associatedtype U
}

class BaseViewModel: BaseViewModelProtocol{
    typealias U = UseCase
    
    var useCase: U?
    var showError: Bool = false
    var isLoading: Bool = false

    init(useCase: U) {
        self.useCase = useCase
    }
}
