//
//  ViewController.swift
//  TestApp
//
//  Created by Dani  on 16/11/2021.
//

import UIKit
import Combine

///this is only to show the logo and define any required steps before continue to the app
class SplashViewController: BaseViewController<SplashScreenViewModel> {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.performSegue(withIdentifier: "CarTypeStoryBoardSegue", sender: self)
        }
    }


}

