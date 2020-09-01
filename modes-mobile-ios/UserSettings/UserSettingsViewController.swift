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
    @IBOutlet weak var viewContainer3: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var buttonSkipAll: UIButton!
    @IBOutlet weak var buttonSkipQuestion: UIButton!

    
    var currentContainer = 1
    
    func showPage1(){
        self.view.bringSubviewToFront(viewContainer1)
        currentContainer = 1
        viewContainer1.isHidden = false
        viewContainer2.isHidden = true
        viewContainer3.isHidden = true
        btnBack.isHidden = true
        
        

        
    }
    func showPage2(){
        
        //TODO:  Animation?
        if currentContainer == 1 {
            //slide animation from right to left of container 2
            print("Show Animation")
            
        } else {
            print("No Animation")   
        }

        self.view.bringSubviewToFront(viewContainer2)
        currentContainer = 2
        viewContainer1.isHidden = true
        viewContainer2.isHidden = false
        viewContainer3.isHidden = true
        btnBack.isHidden = false
    }
    func showPage3(){
        self.view.bringSubviewToFront(viewContainer3)
        currentContainer = 3
        viewContainer1.isHidden = true
        viewContainer2.isHidden = true
        viewContainer3.isHidden = false
        btnBack.isHidden = false
        
    }
    
    @IBAction func btnBack_Touched(_ sender: Any) {
        print("Back Button Touched")
        switch currentContainer {
        case 1:
            print("Current 1")
        case 2:
            print("Current 2")
            showPage1()
        case 3:
            print("Current 3")
            showPage2()
        default:
            print("Default Running")
        }
    }
    
    @IBAction func buttonSkipQuestion_Touached(_ sender: Any) {
        print("Skip Question Button Touched")
        switch currentContainer {
        case 1:
            print("Current 1")
            showPage2()
        case 2:
            print("Current 2")
            showPage3()
        case 3:
            print("Current 3")
            
        default:
            print("Default Running")
        }
    }
    
    @IBAction func buttonSkipAll_Touched(_ sender: Any) {
        print("Skip All Touched")
       
        
        let storyboard = UIStoryboard(name: "Navigation", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "sidemenu_sbid") as! SSASideMenu
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil);

        
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
        
        showPage1()
        
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
