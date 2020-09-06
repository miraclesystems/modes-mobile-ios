//
//  FavoritesBenefitsTableViewCell.swift
//  modes-mobile-ios
//
//  Created by yada on 9/5/20.
//

import UIKit

class FavoritesBenefitsTableViewCell: UITableViewCell {
    
    var parentVc : FavoritesViewController?
    
    @IBOutlet weak var lblFavorite: UILabel!
    
    @IBOutlet weak var buttonFavorite: UIButton!
    
    @IBAction func touchFavorite(_ sender: Any) {
        
        ModesDb.shared.setBenefitavorite(favorite: false, name: self.lblFavorite.text!)
        parentVc?.reloadTables()
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
