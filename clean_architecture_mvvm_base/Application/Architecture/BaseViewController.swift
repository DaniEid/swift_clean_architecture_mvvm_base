//
//  BaseViewController.swift
//  TestApp
//
//  Created by Dani  on 18/11/2021.
//

import Foundation
import UIKit


class BaseViewController<T: BaseViewModel>: UIViewController {
     var viewModel: T?
}
