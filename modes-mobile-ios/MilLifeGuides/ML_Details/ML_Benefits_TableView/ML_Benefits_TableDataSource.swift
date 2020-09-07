//  ML_Benefits_TableDataSource.swift

import UIKit

class ML_Benefits_TableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    

    
    var viewModel : HomeViewModel?
    var parentVc : MilLifeDetailsGuideContVC?
    
   
    var myLabels = [ "Benefit1", "Benefit2", "Benefit3"]
    var myText = ["text1", "text2", "text3"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        //return viewModel?.getBenefits(topic: viewModel?.topic ?? "").count ?? 0
        
        return  parentVc?.guide?.listRelatedBenefits?.count ?? 0
       
    }
    
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
 */

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ML_Benefits_TableCell", for: indexPath) as! ML_Benefits_TableCell
        
       
        
        var benefit = parentVc?.guide?.listRelatedBenefits?[indexPath.row]
        //cell.label.text = myLabels[indexPath.row]
        //cell.label2.text = myText[indexPath.row]
        cell.label.text = benefit?.benefit
        cell.label2.text = benefit?.description
        
        //cell.label.text = viewModel?.getBenefits(topic: viewModel?.topic ?? "")[indexPath.row]
        
        //background
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 0.1
        cell.layer.masksToBounds = false //<-
        
        //cell.layer.backgroundColor = UIColor.white.cgColor
        //tableView.delaysContentTouches = false
        return cell
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    
        
    
    
        let selectedBenefit = parentVc?.guide?.listRelatedBenefits?[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BenefitsDetailsContVC") as! BenefitsDetailsContVC
        
        
        vc.selectedBenefit = selectedBenefit?.benefit
        parentVc?.present(vc, animated: true)
        //parentVc?.parentVc?.showRelatedBenefits(index: indexPath.item)
    }
    

}
