//  ML_Websites_TableDataSource.swift

import UIKit

class ML_Websites_TableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    

    
    var viewModel : HomeViewModel?
    var parentVc : MilLifeDetailsGuideContVC?
    
    var myLabels = [ "Website1", "A Very Long Website2", "Website3"]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return viewModel?.getWebsites(topic: viewModel?.topic ?? "").count ?? 0
        //return myLabels.count
        
        
        print("Websites Datasource Count: ", parentVc?.guide?.RelatedWebsitesText?.count )
        
        return parentVc?.guide?.RelatedWebsitesText?.count ?? 0
       
    }
    
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
 */

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ML_Websites_TableCell", for: indexPath) as! ML_Websites_TableCell
        

        //cell.label.text = myLabels[indexPath.row]
        cell.label.text = parentVc?.guide?.RelatedWebsitesText?[indexPath.row]
        //cell.label.text = viewModel?.getWebsites(topic: viewModel?.topic ?? "")[indexPath.row]
        

        return cell
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //print("label: ", myLabels[indexPath.item])
        
        //Error Handling
        let myIndex = parentVc?.guide?.RelatedWebsitesURL
    print("indexPath.row: ", indexPath.row)
    print("myIndex: ", myIndex!.count)
        if indexPath.row <= myIndex!.count - 1 {
            parentVc?.parentVc?.showRelatedWebsites(urlString: (parentVc?.guide?.RelatedWebsitesURL?[indexPath.row])!)
        }
          
        //parentVc?.parentVc?.showRelatedWebsites(urlString: (parentVc?.guide?.RelatedWebsitesURL?[indexPath.row])!)
    }
    

}
