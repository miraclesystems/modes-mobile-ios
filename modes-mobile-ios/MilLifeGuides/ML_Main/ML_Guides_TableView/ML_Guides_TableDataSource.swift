//  ML_Guides_TableDataSource.swift

import UIKit

class ML_Guides_TableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    

    
    var viewModel : GuidesViewModel?
    var parentVc : MilLifeGuidesController?
    
    var myImages = ["moving", "oconus","housing"]
    var myLabels = [""]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var guides =  parentVc?.viewModel?.getGuidesByCategory(category: (parentVc?.viewModel!.selectedCategory)!)
        
        return guides?.count ?? 0
        //return viewModel?.getGuides(topic: viewModel?.topic ?? "").count ?? 0
        
       
       
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
        
        //cell.label.text = myLabels[indexPath.row]
        
        var guides =  parentVc?.viewModel?.getGuidesByCategory(category: (parentVc?.viewModel!.selectedCategory)!)

        var guide = guides?[indexPath.row]
        cell.label.text = guide?.Guide
        cell.guideImage.image = UIImage(named: (guide?.GuideImage)! + "-200x200.jpg", in: nil, compatibleWith: nil)
        //cell.label.text = viewModel?.getGuides(topic: viewModel?.topic ?? "")[indexPath.row]
        
        //background
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 0.1
        cell.layer.masksToBounds = false //<-
        
        cell.accessibilityLabel = cell.label.text
        
        //cell.layer.backgroundColor = UIColor.white.cgColor
        //tableView.delaysContentTouches = false
        return cell
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //print("label: ", myLabels[indexPath.item])
        var guides =  parentVc?.viewModel?.getGuidesByCategory(category: (parentVc?.viewModel!.selectedCategory)!)
        parentVc?.viewModel?.selectedGuide = guides?[indexPath.row].Guide as! String
        parentVc?.showOverlay(view: (parentVc?.DetailsGuideCont)!)
        parentVc?.vc3?.loadGuide()
    }
    

}
