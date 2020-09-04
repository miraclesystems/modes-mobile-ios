//  Benefits_TableCell.swift

import UIKit

class Benefits_TableCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var guideImage: UIImageView!
  
    @IBOutlet weak var lblText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //backView.layer.cornerRadius = 5;
        //backView.layer.masksToBounds = true;
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
                let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }

}
