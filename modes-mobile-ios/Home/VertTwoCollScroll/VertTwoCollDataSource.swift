//  VertTwoCollDataSource.swift

import UIKit

class VertTwoCollDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var viewModel : HomeViewModel?
    var parentView : VertTwoCollView?
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getBenefits(topic: viewModel?.topic ?? "").count ?? 0
    }

   func collectionView(_ collectionView: UICollectionView,
                       didSelectItemAt indexPath: IndexPath){
    
        var selectedBenefit = viewModel?.getBenefits(topic: viewModel?.topic ?? "")[indexPath.row]
        
        
        let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BenefitsDetailsContVC") as! BenefitsDetailsContVC
        
        vc.selectedBenefit = selectedBenefit
        self.parentView?.parentVc?.present(vc, animated: true)
    
        print("selected")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VertTwoCollCell", for: indexPath) as! VertTwoCollCell
        
       

        
        //cell.backgroundColor = UIColor(hex: myBkgColor[indexPath.item])
        //cell.imageView.image = UIImage(named: myImages[indexPath.item])
        //cell.label.text = myLabels[indexPath.item]
        cell.label.text = viewModel?.getBenefits(topic: viewModel?.topic ?? "")[indexPath.row]
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 0.1
        cell.layer.masksToBounds = false //<-

        
        cell.accessibilityActivate()
        cell.accessibilityLabel = cell.label.text!
        cell.accessibilityValue = cell.label.text!

        collectionView.delaysContentTouches = false
        return cell
    }
    
    
    

}
