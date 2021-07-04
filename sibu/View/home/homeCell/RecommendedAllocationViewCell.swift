//
//  RecommendedAllocationViewCell.swift
//  sibu
//
//  Created by Achmad Fathullah on 05/05/21.
//

import UIKit

class RecommendedAllocationViewCell: UITableViewCell {

    @IBOutlet weak var nominal: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
