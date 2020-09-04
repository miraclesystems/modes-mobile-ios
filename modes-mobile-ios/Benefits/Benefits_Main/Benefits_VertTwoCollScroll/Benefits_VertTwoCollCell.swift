//  Benefits_VertTwoCollCell.swift

import UIKit

class Benefits_VertTwoCollCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.layer.cornerRadius = 5;
        backView.layer.masksToBounds = true;
    }

}
