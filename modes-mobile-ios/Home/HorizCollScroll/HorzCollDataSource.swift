//  HorzCollDataSource.swift

import UIKit

class HorzCollDataSource: NSObject, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorzCollCell", for: indexPath) as! HorzCollCell
        return cell
    }
    
    
    

}
