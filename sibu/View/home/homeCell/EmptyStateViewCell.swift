//
//  EmptyStateViewCell.swift
//  sibu
//
//  Created by Achmad Fathullah on 05/05/21.
//

import UIKit

protocol EmptyStateViewCellDelegate :AnyObject {
    func didClickButtonAddSalary()
}
class EmptyStateViewCell: UITableViewCell {
    
    weak var delegateButton : EmptyStateViewCellDelegate?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onButtonAddClick() {
        delegateButton?.didClickButtonAddSalary()
    }
}
