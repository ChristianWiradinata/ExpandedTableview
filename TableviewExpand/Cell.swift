//
//  Cell.swift
//  TableviewExpand
//
//  Created by Christian Wiradinata on 28/03/22.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var screen: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        screen.layer.cornerRadius = 10.0
        screen.layer.masksToBounds = true;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
