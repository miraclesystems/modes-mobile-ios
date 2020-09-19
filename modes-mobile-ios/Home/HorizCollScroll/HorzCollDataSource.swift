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
        
        //let cards = viewModel?.getSuggestedCards()
        //let card = cards?[indexPath.row]
        
        let cards = parentVc!.parentVc!.myCards
        let card = cards[indexPath.row]
        
        let labelText = card.cardTitle ?? ""
        let titleText = card.cardType ?? ""
        
        cell.label.text = labelText
        cell.label.accessibilityLabel = titleText + ", " + labelText
        cell.labelHeader.text = titleText
        cell.imgRecommended.isHidden = !(card.recommended ?? false)
        
        
        switch card.cardType {
        case "MILLIFE GUIDES":
            cell.headerImage.image = UIImage(named: "millife_ic")
        
        case "BENEFIT":
        cell.headerImage.image = UIImage(named: "benefits_ic")
        cell.headerLabel.text = "BENEFITS"
        
        case "CONNECT":
        cell.headerImage.image = UIImage(named: "connect_ic")
        
        case "ABOUT US":
        cell.headerImage.image = UIImage(named:"home_ic")
            
        default:
            print("default ran")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
            print ("Selected: ", indexPath.row)
            /*
            let cards = viewModel?.getSuggestedCards()
            let cardTitle = cards?[indexPath.row].cardTitle
            let cardType = cards?[indexPath.row].cardType
            */
            
            let cards = parentVc!.parentVc!.myCards
            let cardTitle = cards[indexPath.row].cardTitle
            let cardType = cards[indexPath.row].cardType
            
            
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
                    /*
                    let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "ConnectViewController") as! ConnectViewController
                    parentVc?.present(vc, animated: true)
                    */
                    print("Connect ")
                    parentVc?.parentVc?.tabBarController!.selectedIndex = 4
                
                case "ABOUT US":
                    let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "AboutVC") as! AboutVC
                    parentVc?.present(vc, animated: true)
                
                default:
                    print("do nothing")
            }
        
        //parentVc?.parentVc?.didSelectHorzTile(index: indexPath.row)
        }
        

    
    
    

}
