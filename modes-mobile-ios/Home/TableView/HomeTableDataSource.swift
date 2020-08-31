//  HomeTableDataSource.swift

import UIKit

class HomeTableDataSource: NSObject, UITableViewDataSource{
    
    var myImages = ["moving", "oconus","housing"]
    var myLabels = [ "Moving in the Military", "OCONUS Moves", "Housing"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myLabels.count
    }
    
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
 */

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath) as! HomeTableCell
        
       
        cell.guideImage.image = UIImage(named: myImages[indexPath.item])
        
        //cell.backgroundColor = UIColor(hex: myBkgColor[indexPath.item])
        //cell.imageView.image = UIImage(named: myImages[indexPath.item])
        cell.label.text = myLabels[indexPath.item]
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 0.2
        cell.layer.masksToBounds = false //<-
        
        //cell.layer.backgroundColor = UIColor.blue.cgColor
        
        //tableView.delaysContentTouches = false
        return cell
    }
    
    
    

}
