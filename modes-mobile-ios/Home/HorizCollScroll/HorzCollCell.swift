//  HorzCollCell.swift

import UIKit

class HorzCollCell: UICollectionViewCell {

    @IBOutlet weak var labelHeader: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var bottomImage: UIImageView!
    @IBOutlet weak var imgRecommended: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.layer.cornerRadius = 5;
        backView.layer.masksToBounds = true;
    }
    
    override var isHighlighted: Bool {
        didSet {
            if self.isHighlighted {
                backgroundColor = UIColor.gray
                
            } else {
                backgroundColor = UIColor.black
            }
        }
    }

}
