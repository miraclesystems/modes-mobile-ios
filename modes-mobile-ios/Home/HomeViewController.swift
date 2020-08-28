//
//  FirstViewController.swift
//  ndgTabTest
//
//  Created by Neal Gentry on 8/24/20.
//  Copyright © 2020 Neal Gentry. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var MainView1: UIView!
    @IBOutlet weak var MainView2: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hide the 2nd View
        //MainView2.isHidden = true
        

        // Do any additional setup after loading the view.
        /*
        //  This loads the hamburger menu on the right side
               self.navigationController?.navigationBar.tintColor = UIColor.black
               //create a new button
               let button = UIButton.init(type: .custom)
               //set image for button
               button.setImage(UIImage(named: "navbar_menu"), for: UIControl.State.normal)
               //add function for button
               button.addTarget(self, action: #selector(SSASideMenu.presentRightMenuViewController), for: UIControl.Event.touchUpInside)
               //set frame
               button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
               let barButton = UIBarButtonItem(customView: button)
               //assign button to navigationbar
               self.navigationItem.rightBarButtonItem = barButton
               
              // self.navigationController?.navigationBar.tintColor = UIColor(hex: 0xA74795)
        */
        
    }
    
    override func viewWillAppear(_ Animated: Bool) {
        MainView2.isHidden = true
    }
    
    //Segue for passing data back
    // This is your unwind Segue, and it must be a @IBAction
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {
        let source = segue.source as? LocTableViewController // This is the source
        print("Back on HomeVC from unwindSearch")
        
        let seconds = 0.15
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.MainView2.isHidden = false
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

}

