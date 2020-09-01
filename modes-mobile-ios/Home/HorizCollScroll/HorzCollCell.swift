//  HorzCollCell.swift

import UIKit

class HorzCollCell: UICollectionViewCell {

    @IBOutlet weak var labelHeader: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var imgRecommended: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.layer.cornerRadius = 5;
        backView.layer.masksToBounds = true;
    }

}
