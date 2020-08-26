//
//  UserSettingsDescriptionViewController.swift
//  modes-mobile-ios
//
//  Created by yada on 8/22/20.
//

import UIKit

class UserSettingsDescriptionViewController: UIViewController {
    
    var userDescription = ""
    
    @IBAction func touchServiceMember(_ sender: Any) {
        userDescription = "Service Member"
        updatePrefs()
    }
    
    @IBAction func touchSpouse(_ sender: Any) {
        userDescription = "Spouse"
        updatePrefs()
    }
    
    @IBAction func touchFamilyMember(_ sender: Any) {
        userDescription = "Family Member"
        updatePrefs()
    }
   
    @IBAction func touchOther(_ sender: Any) {
        userDescription = "Other"
        updatePrefs()
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
