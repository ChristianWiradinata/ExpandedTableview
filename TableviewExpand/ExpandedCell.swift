//
//  ExpandedCell.swift
//  TableviewExpand
//
//  Created by Christian Wiradinata on 28/03/22.
//

import UIKit

protocol ExpandedCellDelegate:NSObjectProtocol{
    func buttonClicked(indexPath:IndexPath, isChecked:Bool)
}

class ExpandedCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var button: UIButton!
    weak var delegate:ExpandedCellDelegate?
    public var indexPath:IndexPath!
    
    var isChecked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func onClick(_ sender: Any) {
        isChecked = !isChecked
        setButton()
        print("Button = \(isChecked)")
    }
    
    private func setButton(){
//        if isChecked==true {
//            button.titleLabel?.text = "Check"
//        } else {
//            button.titleLabel?.text = "Uncheck"
//        }
        if let delegate = self.delegate{
            delegate.buttonClicked(indexPath: indexPath, isChecked: isChecked)
        }
    }
}
