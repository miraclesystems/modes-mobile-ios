//  VertTwoCollDataSource.swift

import UIKit

class VertTwoCollDataSource: NSObject, UICollectionViewDataSource{
    
    
    var myLabels = ["Temporary Lodging Allowance - TLA", "Temporary Lodging Expenses - TLE", "Shipping ", "Again More", "And Again", "And Much More", "More", "And More", "And Much More"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myLabels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VertTwoCollCell", for: indexPath) as! VertTwoCollCell
        
       

        
        //cell.backgroundColor = UIColor(hex: myBkgColor[indexPath.item])
        //cell.imageView.image = UIImage(named: myImages[indexPath.item])
        cell.label.text = myLabels[indexPath.item]
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 0.2
        cell.layer.masksToBounds = false //<-
        
        collectionView.delaysContentTouches = false
        return cell
    }
    
    
    

}
