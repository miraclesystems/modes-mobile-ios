//
//  UserSettingsViewController.swift
//  modes-mobile-ios
//
//  Created by yada on 8/20/20.
//

import UIKit

class UserSettingsViewController: UIViewController {

    
    // the view model
    var viewModel : UserSettingsViewModel?
    
    /// IBOutlets
    
    // container views
    @IBOutlet weak var viewContainer1: UIView!
    @IBOutlet weak var viewContainer2: UIView!
    @IBOutlet weak var viewContaier3: UIView!
    
    // the skip button
    @IBOutlet weak var buttonSkip: UIButton!
    
    
    func showPage1(){
        self.view.bringSubviewToFront(viewContainer1)
    }
    func showPage2(){
        self.view.bringSubviewToFront(viewContainer2)
    }
    func showPage3(){
        self.view.bringSubviewToFront(viewContaier3)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // set a reference back to the parent vc for contained view controllers
        // this is how the childeren should reference the view model
        
        for child in self.children{
            
            switch child{
                
            case is UserSettingsDescriptionViewController:
                (child as! UserSettingsDescriptionViewController).parentVc = self
            case is UserSettingsInstallationsViewController:
            (child as! UserSettingsInstallationsViewController).parentVc = self
            case is UserSettingsBranchViewController:
            (child as! UserSettingsBranchViewController).parentVc = self
            default:
                break
            }
        }
        
        
        // instantiate our view model
        viewModel = UserSettingsViewModel()
        
        // become an overserver of the  view model
        viewModel?.addObserver(self, forKeyPath: "businessLoaded", options: [.new, .old], context: nil)
        
        /// go make the api call to get the installations
        viewModel?.getInstallations()
        
    }
    

    /// watch the view model
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    
        if keyPath == "dataLoaded"{
            print("dataaLoaded changed ")
            print(change![NSKeyValueChangeKey.newKey] as!  Int)
             print(change![NSKeyValueChangeKey.newKey] as!  Int)
            if(change![NSKeyValueChangeKey.newKey] as! Int  == 0){
                return
            }
        
           
            // do what ever on the ui in this thread
            DispatchQueue.main.async {
                print("installations should be loaded")
                
            }
        }
    }

}
