//  ML_Connect_TableDataSource.swift

import UIKit

class ML_Connect_TableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    

    
    var viewModel : HomeViewModel?
    var parentVc : MilLifeDetailsGuideContVC?
    
    var myLabels = [ "Navigation COVID-19 Travel Restrictions", "Foreign-born Spouse Support", "Personalized Moving Plans"]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        //return viewModel?.getConnect(topic: viewModel?.topic ?? "").count ?? 0
        
        return myLabels.count
       
    }
    
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
 */

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ML_Connect_TableCell", for: indexPath) as! ML_Connect_TableCell
        

        cell.label.text = myLabels[indexPath.row]
        //cell.label.text = viewModel?.getConnect(topic: viewModel?.topic ?? "")[indexPath.row]
        

        return cell
    }
   
    /*
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("label: ", myLabels[indexPath.item])
        //parentVc?.showOverlay(view: (parentVc?.DetailsGuideCont)!)
    }
    */

}