//
//  ManufacturerCell.swift
//  TestApp
//
//  Created by Dani  on 19/11/2021.
//

import UIKit

class ManufacturerCell: UITableViewCell {
    
    static let nibName = "ManufacturerCell"

    @IBOutlet weak var nameLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(name: String, isEven: Bool){
        nameLabel.text = name
        self.contentView.backgroundColor = isEven ? .systemGray4 : .systemGray6
    }
    
}
