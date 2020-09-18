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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /// IBOutlets
    
    // container views
    @IBOutlet weak var viewContainer1: UIView!
    @IBOutlet weak var viewContainer2: UIView!
    @IBOutlet weak var viewContainer3: UIView!
    @IBOutlet weak var viewContainer4: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var buttonSkipAll: UIButton!
    @IBOutlet weak var buttonSkipQuestion: UIButton!
    
    //Constraint X position for Animation
    @IBOutlet weak var viewContainer2CenterX: NSLayoutConstraint!
    
    @IBOutlet weak var preparingImage: UIImageView!
    

    @IBOutlet weak var imageLogo: UIImageView!
    
    var currentContainer = 1
    
    //What best Describes you selection
    var describesSelection = 0
    
    //Did User Complete Question
    var oneComplete = false
    var twoComplete = false
    var threeComplete = false
    
    func setFocus(){
        UIAccessibility.post(notification: UIAccessibility.Notification.layoutChanged, argument: self.imageLogo)
        UIAccessibility.post(notification: UIAccessibility.Notification.screenChanged, argument: self.imageLogo)
    }

    
    func showPage1(){
        //Configure Page1, questions answered or skipped
        
        for case let vc1 as UserSettingsDescriptionViewController in self.children {
                if oneComplete == true {
                    vc1.indDesc1.setBackgroundImage(UIImage(named:"selector_checked"), for: .normal)
                    vc1.indDesc1.setTitle("", for: .normal)
                } else {
                    vc1.indDesc1.setBackgroundImage(UIImage(named:"selector_highlighted"), for: .normal)
                    vc1.indDesc1.setTitle("1", for: .normal)
                    vc1.indDesc1.setTitleColor(UIColor(hex: 0xFFFFFF), for: .normal)
                }
            
                if twoComplete == true {
                    vc1.indDesc2.setBackgroundImage(UIImage(named:"selector_checked"), for: .normal)
                    vc1.indDesc2.setTitle("", for: .normal)
                } else {
                    vc1.indDesc2.setBackgroundImage(UIImage(named:"selector"), for: .normal)
                    vc1.indDesc2.setTitle("2", for: .normal)
                    vc1.indDesc2.setTitleColor(UIColor(hex: 0x7577E2), for: .normal)
                }
            
                if threeComplete == true {
                    vc1.indDesc3.setBackgroundImage(UIImage(named:"selector_checked"), for: .normal)
                    vc1.indDesc3.setTitle("", for: .normal)
                } else {
                    vc1.indDesc3.setBackgroundImage(UIImage(named:"selector"), for: .normal)
                    vc1.indDesc3.setTitle("3", for: .normal)
                    vc1.indDesc3.setTitleColor(UIColor(hex: 0x7577E2), for: .normal)
                }
            
        }
        
        
        
        
        self.view.bringSubviewToFront(viewContainer1)
        currentContainer = 1
        viewContainer1.isHidden = false
        viewContainer2.isHidden = true
        viewContainer3.isHidden = true
        viewContainer4.isHidden = true
        btnBack.isHidden = true
        
        
        
        
        setFocus()
        
        
    }
    
    
    func showPage2(){
        
        //Configure Page2, question 1 answered or skipped
        for case let vc2 as UserSettingsInstallationsViewController in self.children {
                if oneComplete == true {
                    vc2.indBtn1Install.setBackgroundImage(UIImage(named:"selector_checked"), for: .normal)
                    vc2.indBtn1Install.setTitle("", for: .normal)
                } else {
                    vc2.indBtn1Install.setBackgroundImage(UIImage(named:"selector"), for: .normal)
                    vc2.indBtn1Install.setTitle("1", for: .normal)
                    vc2.indBtn1Install.setTitleColor(UIColor(hex: 0x7577E2), for: .normal)
                }
            
                if twoComplete == true {
                    vc2.indBtn2Install.setBackgroundImage(UIImage(named:"selector_checked"), for: .normal)
                    vc2.indBtn2Install.setTitle("", for: .normal)
                } else {
                    vc2.indBtn2Install.setBackgroundImage(UIImage(named:"selector_highlighted"), for: .normal)
                    vc2.indBtn2Install.setTitle("2", for: .normal)
                    vc2.indBtn2Install.setTitleColor(UIColor(hex: 0xFFFFFF), for: .normal)
                }
            
                if threeComplete == true {
                    vc2.indBtn3Install.setBackgroundImage(UIImage(named:"selector_checked"), for: .normal)
                    vc2.indBtn3Install.setTitle("", for: .normal)
                } else {
                    vc2.indBtn3Install.setBackgroundImage(UIImage(named:"selector"), for: .normal)
                    vc2.indBtn3Install.setTitle("3", for: .normal)
                    vc2.indBtn3Install.setTitleColor(UIColor(hex: 0x7577E2), for: .normal)
                }
            vc2.searchInstBtn.setTitle("Search installations", for: UIControl.State.normal)
        }
        
        //TODO:  Animation?
        if currentContainer == 1 {
            //slide animation from right to left of container 2
            print("Show Animation")
            
            
            
            UIView.animate(withDuration: 0.25, delay: 0, options: UIView.AnimationOptions(), animations: { () -> Void in
                self.viewContainer2.frame = CGRect(x: -400, y: self.viewContainer2.frame.origin.y, width: self.view.frame.size.width ,height: self.view.frame.size.height)
                self.viewContainer1.alpha = 0

            }, completion: { (finished: Bool) -> Void in
                self.viewContainer1.isHidden = true
                self.viewContainer1.alpha = 1
            })
            
            
            
        } else {
            print("No Animation")
            viewContainer1.isHidden = true
        }

        self.view.bringSubviewToFront(viewContainer2)
        currentContainer = 2
        //viewContainer1.isHidden = true
        viewContainer2.isHidden = false
        viewContainer3.isHidden = true
        viewContainer4.isHidden = true
        btnBack.isHidden = false
        view.bringSubviewToFront(btnBack)
        setFocus()
        
    }
    func showPage3(){
        for case let vc3 as UserSettingsBranchViewController in self.children {
                    if oneComplete == true {
                        vc3.indBtn1Branch.setBackgroundImage(UIImage(named:"selector_checked"), for: .normal)
                        vc3.indBtn1Branch.setTitle("", for: .normal)
                    } else {
                        vc3.indBtn1Branch.setBackgroundImage(UIImage(named:"selector"), for: .normal)
                        vc3.indBtn1Branch.setTitle("1", for: .normal)
                        vc3.indBtn1Branch.setTitleColor(UIColor(hex: 0x7577E2), for: .normal)
                    }
                
                    if twoComplete == true {
                        vc3.indBtn2Branch.setBackgroundImage(UIImage(named:"selector_checked"), for: .normal)
                        vc3.indBtn2Branch.setTitle("", for: .normal)
                    } else {
                        vc3.indBtn2Branch.setBackgroundImage(UIImage(named:"selector"), for: .normal)
                        vc3.indBtn2Branch.setTitle("2", for: .normal)
                        vc3.indBtn2Branch.setTitleColor(UIColor(hex: 0x7577E2), for: .normal)
                    }
                
                    if threeComplete == true {
                        vc3.indBtn3Branch.setBackgroundImage(UIImage(named:"selector_checked"), for: .normal)
                        vc3.indBtn3Branch.setTitle("", for: .normal)
                    } else {
                        vc3.indBtn3Branch.setBackgroundImage(UIImage(named:"selector_highlighted"), for: .normal)
                        vc3.indBtn3Branch.setTitle("3", for: .normal)
                        vc3.indBtn3Branch.setTitleColor(UIColor(hex: 0xFFFFFF), for: .normal)
                    }
        }
        
        
        //TODO:  Animation?
        if currentContainer == 2 {
            //slide animation from right to left of container 2
            print("Show Animation")
            UIView.animate(withDuration: 0.25, delay: 0, options: UIView.AnimationOptions(), animations: { () -> Void in
                self.viewContainer3.frame = CGRect(x: -400, y: self.viewContainer2.frame.origin.y, width: self.view.frame.size.width ,height: self.view.frame.size.height)
                self.viewContainer2.alpha = 0

            }, completion: { (finished: Bool) -> Void in
                self.viewContainer2.isHidden = true
                self.viewContainer2.alpha = 1
            })
            
        } else {
            print("No Animation")
            viewContainer2.isHidden = true
        }
        
        
        self.view.bringSubviewToFront(viewContainer3)
        
        currentContainer = 3
        viewContainer1.isHidden = true
        //viewContainer2.isHidden = true
        viewContainer3.isHidden = false
        viewContainer4.isHidden = true
        btnBack.isHidden = false
        view.bringSubviewToFront(btnBack)
        setFocus()
        
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
            //Configure Page1
            for case let vc1 as UserSettingsDescriptionViewController in self.children {
                vc1.unselectAllBtns()
                vc1.userDescription = ""
                vc1.updatePrefs()
            }
            oneComplete = false
            showPage2()
            
        case 2:
            print("Current 2")
            twoComplete = false
            for case let vc2 as UserSettingsInstallationsViewController in self.children {
                vc2.searchInstBtn.setTitle("", for: .normal)
            }
            
            
            showPage3()
        case 3:
            print("Current 3")
            //Goto to Home
            buttonSkipAll_Touched(self)
            
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
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        // And some actions
    }
    
    var picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker)
        picker.isHidden = true
        picker.backgroundColor = UIColor.white

        imageLogo.isAccessibilityElement = true
        
        

        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageLogo.isUserInteractionEnabled = true
        imageLogo.addGestureRecognizer(tapGestureRecognizer)
        
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
