//  HorzCollDataSource.swift

import UIKit

class HorzCollDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var viewModel : HomeViewModel?
    
    var parentVc : HomeContView1VC?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getSuggestedCards().count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorzCollCell", for: indexPath) as! HorzCollCell
        
        let cards = viewModel?.getSuggestedCards()
        let card = cards?[indexPath.row]
        
        cell.label.text = card?.cardTitle
        cell.labelHeader.text = card?.cardType
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
            print ("Selected: ", indexPath.row)
            let cards = viewModel?.getSuggestedCards()
            let cardTitle = cards?[indexPath.row].cardTitle
            let cardType = cards?[indexPath.row].cardType
            
            switch cardType{
                
            case "BENEFIT":
                    let selectedBenefit = cardTitle
                    
                    let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "BenefitsDetailsContVC") as! BenefitsDetailsContVC
                    vc.selectedBenefit = selectedBenefit
                    parentVc?.present(vc, animated: true)
                
                case "MILLIFE GUIDES":
                    let selectedGuide = cardTitle
                    let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "MilLifeDetailsGuideContVC") as! MilLifeDetailsGuideContVC
                    vc.selectedGuide = selectedGuide
                    parentVc?.present(vc, animated: true)
                case "CONNECT":
                    let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "ConnectViewController") as! ConnectViewController
                    parentVc?.present(vc, animated: true)
                
                case "ABOUT US":
                    print("do nothing")
                default:
                    print("do nothing")
            }
        
        //parentVc?.parentVc?.didSelectHorzTile(index: indexPath.row)
        }
        

    
    
    

}
