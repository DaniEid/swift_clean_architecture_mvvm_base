//
//  MainTypesViewControllerExtension.swift
//  TestApp
//
//  Created by Dani  on 20/11/2021.
//

import Foundation
import UIKit

extension MainTypesViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.currentCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let currentCount = viewModel?.currentCount ?? 0
        if(indexPath.row == currentCount - 1) {
            if(viewModel!.shouldFetchNextPage) {
                viewModel!.pageNumber += 1
                setupViewModelObserver()
                self.tableView.tableFooterView?.isHidden = false
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ManufacturerCell.nibName) as? ManufacturerCell {
            cell.loadData(name: viewModel!.itemName(index: indexPath.row), isEven: indexPath.row % 2 == 0 )
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel?.itemAt(index: indexPath.row)?.name ?? ""
        let manufacturerName = viewModel?.manufacturer?.name ?? ""
        let message = "\(manufacturerName) , \(model)"
       
        self.showAlert(title: "show_type_alert_title".localized, message: message) { action in
            
        }
    }
    
    
}

