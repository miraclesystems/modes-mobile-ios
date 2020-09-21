//
//  UserSettingsDescriptionViewController.swift
//  modes-mobile-ios
//
//  Created by yada on 8/22/20.
//

import UIKit

class UserSettingsDescriptionViewController: UIViewController {
    
    //QA Buttons
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    //Top Buttons
    @IBOutlet weak var indDesc1: UIButton!
    @IBOutlet weak var indDesc2: UIButton!
    @IBOutlet weak var indDesc3: UIButton!
    
    
    var userDescription = ""
    
    func unselectAllBtns(){
        btn1.isSelected = false
        btn2.isSelected = false
        btn3.isSelected = false
        btn4.isSelected = false
    }
    
    @IBAction func touchServiceMember(_ sender: Any) {
        self.parentVc?.oneComplete = true
        userDescription = "Service Member"
        updatePrefs()
        btn1.isSelected = true
        btn2.isSelected = false
        btn3.isSelected = false
        btn4.isSelected = false
    }
    
    @IBAction func touchSpouse(_ sender: Any) {
        self.parentVc?.oneComplete = true
        userDescription = "Military Spouse"
        updatePrefs()
        btn1.isSelected = false
        btn2.isSelected = true
        btn3.isSelected = false
        btn4.isSelected = false
    }
    
    @IBAction func touchFamilyMember(_ sender: Any) {
        self.parentVc?.oneComplete = true
        userDescription = "Family Member"
        updatePrefs()
        btn1.isSelected = false
        btn2.isSelected = false
        btn3.isSelected = true
        btn4.isSelected = false
    }
   
    @IBAction func touchOther(_ sender: Any) {
        self.parentVc?.oneComplete = true
        userDescription = "Other"
        updatePrefs()
        btn1.isSelected = false
        btn2.isSelected = false
        btn3.isSelected = false
        btn4.isSelected = true
    }
    
    
    @IBAction func touch2(_ sender: Any) {
        parentVc?.showPage2()
        
    }
    
    @IBAction func touch3(_ sender: Any) {
        parentVc?.showPage3()
    }
    
    func updatePrefs(){
        self.parentVc?.viewModel?.setUserDescription(description: userDescription)
        touch2(self)
    }
    
    var parentVc : UserSettingsViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
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
