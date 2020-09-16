//  Benefits_ViewAll_TableDataSource.swift

import UIKit

class Benefits_ViewAll_TableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    

    
    var viewModel : HomeViewModel?
    var parentVc : BenefitsViewAllContVC?
    
    
    var myLabels = [ "Moving in the Military", "OCONUS Moves", "Housing"]
    var myLabels2 = [ "One", "Two", "Three"]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
       
        return parentVc?.parentVc?.viewModel?.getAllBenefits().count ?? 0
        //return myLabels.count
       
    }
    
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
 */

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Benefits_ViewAll_TableCell", for: indexPath) as! Benefits_ViewAll_TableCell
        


        
        //cell.backgroundColor = UIColor(hex: myBkgColor[indexPath.item])
        //cell.imageView.image = UIImage(named: myImages[indexPath.item])
        
        //cell.label.text = parentVc?.parentVc?.viewModel?.getAllBenefits()[indexPath.row]
        
        var benefit = (parentVc?.parentVc?.viewModel?.getAllBenefits()[indexPath.row])! as Benefit
        cell.label.text = benefit.Benefit
        cell.lblText.text = benefit.ShortDescription
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
        //print("label: ", myLabels[indexPath.item])
    
        var benefit = (parentVc?.parentVc?.viewModel?.getAllBenefits()[indexPath.row])! as Benefit
        parentVc?.parentVc?.viewModel?.selectedBenefit = benefit.Benefit!
    
    
        
        /*
        let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BenefitsDetailsContVC") as! BenefitsDetailsContVC
        
        vc.selectedBenefit = benefit.Benefit
        parentVc?.present(vc, animated: true)
        */
        
        parentVc?.parentVc?.vc3?.loadBenefit()
        parentVc?.parentVc?.showOverlay(view: (parentVc?.parentVc?.DetailsBenefits)!)
        

        
    }
    

}
