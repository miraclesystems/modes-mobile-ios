//  HomeTableCell.swift

import UIKit

class HomeTableCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //backView.layer.cornerRadius = 5;
        //backView.layer.masksToBounds = true;
    }

}
