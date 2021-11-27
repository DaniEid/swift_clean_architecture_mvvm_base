//
//  MainTypesViewController.swift
//  TestApp
//
//  Created by Dani  on 20/11/2021.
//

import Foundation

//
//  ManufacturerViewController.swift
//  TestApp
//
//  Created by Dani  on 18/11/2021.
//

import Foundation
import UIKit
import Combine

class MainTypesViewController: BaseViewController<MainTypesViewModel> {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.addSpinner()
        }
    }
    
    var observers: [AnyCancellable] = []
    
    override func viewDidLoad() {

        setupViewModelObserver()
        let manufacturerName = self.viewModel?.manufacturer?.name
        self.title = "\(manufacturerName ?? "") " + "main_types_screen_title".localized
    
        setupCells()
    
        super.viewDidLoad()
    }
    
    ///register cell within the table view
    func setupCells(){
        tableView.register(UINib(nibName: ManufacturerCell.nibName, bundle: nil), forCellReuseIdentifier: ManufacturerCell.nibName)
        
    }
    

    
    ///this function will handle the response from combine and reflect the result on the UI
    func setupViewModelObserver() {
        
        if(viewModel != nil) {
            self.viewModel!.isLoading = true
            
            if(viewModel!.isLoading && viewModel!.pageNumber == 0) {
                view.showLoader()
            }
           
            self.viewModel!.fetchData()?.receive(on: DispatchQueue.main).sink( receiveCompletion: {[weak self] completion in
              
                self?.viewModel?.isLoading = false
                self?.view.hideLoader()
                self?.tableView.tableFooterView?.isHidden = true
                
                switch completion {
                case .finished:
                    print("Finished calling)")
                case .failure(let error):
                    print("Error calling \(error)")
                    self?.showAlert(title: "error_title".localized, message: error.message, completion: {[weak self] action in
                        self?.setupViewModelObserver()
                    })
                   

                }
            }, receiveValue: {[weak self] response in
                print("Response Successfully parsed with \(String(describing: response))")
                let model = self?.viewModel
                if(response != nil) {
                    model?.handleResponse(response: response!)
                    
                }
                
                let pageNumber = model?.pageNumber ?? 0
                if(pageNumber > 0) {
                    let newIndexPaths = self?.viewModel?.calculateIndexPathsToReload(from: (self?.viewModel!.currentCount)!)
                    self?.onFetchCompleted(with: newIndexPaths)
                }else {
                    self?.onFetchCompleted(with: .none)
                }
            }).store(in: &observers)
        }
    }
    
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?) {
        // if we don't have anydata then reload all table and show the first result
        guard let newIndexPathsToReload = newIndexPathsToReload else {
            tableView.reloadData()
            return
        }
        // we avoid reloading all the table view
        self.tableView.insertRows(at: newIndexPathsToReload, with: .automatic)
        tableView.reloadRows(at: newIndexPathsToReload, with: .automatic)
    }
}
