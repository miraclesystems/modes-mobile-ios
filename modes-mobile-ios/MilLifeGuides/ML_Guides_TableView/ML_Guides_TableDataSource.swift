//  ML_Guides_TableDataSource.swift

import UIKit

class ML_Guides_TableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    

    
    var viewModel : HomeViewModel?
    var myImages = ["moving", "oconus","housing"]
    var myLabels = [ "Moving in the Military", "OCONUS Moves", "Housing"]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        //return viewModel?.getGuides(topic: viewModel?.topic ?? "").count ?? 0
        
        return myLabels.count
       
    }
    
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
 */

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ML_Guides_TableCell", for: indexPath) as! ML_Guides_TableCell
        

       
        cell.guideImage.image = UIImage(named: "guide_placeholder")

        
        //cell.backgroundColor = UIColor(hex: myBkgColor[indexPath.item])
        //cell.imageView.image = UIImage(named: myImages[indexPath.item])
        
        cell.label.text = myLabels[indexPath.row]
        //cell.label.text = viewModel?.getGuides(topic: viewModel?.topic ?? "")[indexPath.row]
        
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
        print("label: ", myLabels[indexPath.item])
        
    }
    

}
