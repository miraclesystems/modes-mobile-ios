//  VertTwoCollCell.swift

import UIKit

class VertTwoCollCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var label: UILabel!
    
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
