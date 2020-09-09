//  Benefits_TableDataSource.swift

import UIKit

class Benefits_TableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    

    
    var viewModel : GuidesViewModel?
    var parentVc : BenefitsController?
    
    var myLabels = ["moving", "oconus","housing"]
    var myLabels2 = ["one", "two", "three"]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

       // return benefits?.count ?? 0
       return  parentVc?.viewModel?.getBenifitsByCategory().count ?? 0
    }
    
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
 */

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Benefits_TableCell", for: indexPath) as! Benefits_TableCell
        

    
        
        let benefit = parentVc?.viewModel?.getBenifitsByCategory()[indexPath.row]
        
        cell.label.text = benefit?.Benefit
        cell.lblText.text = benefit?.ShortDescription
        
        
        
        //background
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 0.1
        cell.layer.masksToBounds = false //<-
        
        
        return cell
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("label: ", myLabels[indexPath.item])
    
 let benefit = parentVc?.viewModel?.getBenifitsByCategory()[indexPath.row]
        parentVc?.viewModel?.selectedBenefit = benefit?.Benefit as! String
    
        parentVc?.showOverlay(view: (parentVc?.DetailsBenefits)!)
    }
    

}
