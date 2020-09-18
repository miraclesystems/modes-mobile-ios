//
//  HomeContView1VC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 8/30/20.
//
//

import UIKit

class HomeContView1VC: UIViewController {

    var parentVc : HomeViewController?
    
   
    
    @IBOutlet weak var horzCollView: HorzCollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        horzCollView.collectionDataSource.parentVc = self
}
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIAccessibility.post(notification: UIAccessibility.Notification.layoutChanged, argument: self.horzCollView.labelBrowseContent)
        UIAccessibility.post(notification: UIAccessibility.Notification.screenChanged, argument: self.horzCollView.labelBrowseContent)
        
        //ml_verttwocollview.collectionView.reloadData()
    }
    
    
    //Segue for passing data forward
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let source = segue.destination as? SearchTableViewController
        source?.viewModel = self.parentVc?.viewModel
        print("stop")
        /*
        let vc = segue.destination as! LocTableViewController
        vc.fromGeoLoc = geoLocation
        if geoLocation == false {
            vc.namesArr = (parentVc?.viewModel?.locationsModel.items!.map { $0!.name! })!
        } else {
            vc.namesArr = filteredArray
        }
        */
    }
    
    
    //Segue for passing data back
    // This is your unwind Segue, and it must be a @IBAction
    @IBAction func unwindToContView1VC(segue: UIStoryboardSegue) {
        let source = segue.source as? SearchTableViewController // This is the source
        
        
        source?.viewModel = parentVc?.viewModel
        parentVc?.viewModel.topic = source?.mySelection as! String
        
        print("Back on HomeVC from unwindToContView1VC")
        
        
        
        
        
        let seconds = 0.35
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.parentVc?.HomeContView2.isHidden = false
            
            let viewToAnimate2 = self.parentVc?.HomeContView2
            UIView.animate(withDuration: 0.25){
                viewToAnimate2!.alpha = 1
            }
            let viewToAnimate1 = self.parentVc?.HomeContView1
            UIView.animate(withDuration: 0.25, animations: {
                viewToAnimate1!.alpha = 0
            }) { _ in
                viewToAnimate1!.isHidden = true
            }
            
            
            
        }
        
        
        
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
