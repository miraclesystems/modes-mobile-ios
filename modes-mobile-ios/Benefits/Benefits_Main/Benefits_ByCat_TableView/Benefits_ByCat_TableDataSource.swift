//  Benefits_ByCat_TableDataSource.swift

import UIKit

class Benefits_ByCat_TableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    

    
   
    var parentVc : BenefitsByCatContVC?
    
    
    var myLabels = [ "Non-Medical Counseling", "Wellness & Life Coaching", "DIscounts & Exclusive Offers"]
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return parentVc?.parentVc?.viewModel?.getCategories().count ?? 0
        //return myLabels.count
       
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Benefits_ByCat_TableCell", for: indexPath) as! Benefits_ByCat_TableCell
        


        
        //cell.backgroundColor = UIColor(hex: myBkgColor[indexPath.item])
        //cell.imageView.image = UIImage(named: myImages[indexPath.item])
        
        //cell.label.text = parentVc?.parentVc?.viewModel?.getAllBenefits()[indexPath.row]
        //cell.label.text = myLabels[indexPath.row]
        //cell.label.text = viewModel?.getBenefits(topic: viewModel?.topic ?? "")[indexPath.row]
        cell.label.text = parentVc?.parentVc?.viewModel?.getCategories()[indexPath.row]
        
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
        
       // print("label: ", myLabels[indexPath.item])

        parentVc?.parentVc?.viewModel?.selectedCategory = parentVc?.parentVc?.viewModel?.getCategories()[indexPath.row] as! String

        parentVc?.parentVc?.benefits_tableview.tableView.reloadData()
        
        parentVc?.parentVc?.showOverlay(view: (parentVc?.parentVc?.BenefitsTableView)!)
        
    }
    

}
