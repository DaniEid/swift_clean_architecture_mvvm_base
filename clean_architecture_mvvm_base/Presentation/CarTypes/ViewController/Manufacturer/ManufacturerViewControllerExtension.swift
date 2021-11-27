//
//  ManufacturerViewControllerExtension.swift
//  TestApp
//
//  Created by Dani  on 20/11/2021.
//

import Foundation
import UIKit

extension ManufacturerViewController: UITableViewDataSource, UITableViewDelegate{
    
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
        self.performSegue(withIdentifier: "ShowMainTypesSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextScene =  segue.destination as? MainTypesViewController {
            
            // Pass the selected object to the new view controller.
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedManufacturer = viewModel?.itemAt(index: indexPath.row)
                if(selectedManufacturer != nil) {
                    nextScene.viewModel = MainTypesViewModel(manufacturer: selectedManufacturer!)
                }
            }
        }
    }
}
