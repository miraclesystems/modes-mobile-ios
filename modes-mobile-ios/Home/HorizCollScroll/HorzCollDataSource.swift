//  HorzCollDataSource.swift

import UIKit

class HorzCollDataSource: NSObject, UICollectionViewDataSource {
    
    var viewModel : HomeViewModel?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getSuggestedCards().count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cards = viewModel?.getSuggestedCards()
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorzCollCell", for: indexPath) as! HorzCollCell
        
        var card = cards?[indexPath.row]
        
        cell.label.text = card?.cardTitle
        cell.labelHeader.text = card?.cardType
        
        
        
    
        return cell
    }
    
    
    

}
