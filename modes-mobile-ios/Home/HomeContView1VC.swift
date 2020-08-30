//
//  HomeContView1VC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 8/30/20.
//

import UIKit

class HomeContView1VC: UIViewController {

    var parentVc : HomeViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //Segue for passing data forward
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
        print("Back on HomeVC from unwindToContView1VC")
        
        let seconds = 0.15
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.parentVc?.HomeContView2.isHidden = false
        }
        
        //TODO: 2nd Home Page Functionality
        
        /*
        if source?.backWithData == true {
            let mySelect = source?.mySelection
            print("mySelect: ", mySelect)
            
            searchInstBtn.setTitle(mySelect, for: .normal)
            self.parentVc?.viewModel?.setInstallation(installation: mySelect ?? "")
            /*
            let seconds = 0.75
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.parentVc?.showPage3()
            }
            */
            self.parentVc?.showPage3()
        } else {
            //back from upper right button press
            //navigate to the other desired screen
            print("Switching Location Screens")
            let seconds = 0.5
            if source?.fromGeoLoc == true {
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    self.gotoSearchInstalltions()
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    self.goGeoLocate()
                }
            }
        }
        */
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
