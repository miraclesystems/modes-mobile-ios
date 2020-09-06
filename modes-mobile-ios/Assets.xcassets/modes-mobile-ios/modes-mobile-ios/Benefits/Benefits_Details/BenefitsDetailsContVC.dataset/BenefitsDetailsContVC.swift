//
//  BenefitsDetailsContVC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 9/3/20.
//

import UIKit

class BenefitsDetailsContVC: UIViewController {

    var parentVc : BenefitsController?
   
    //page elements
    @IBOutlet weak var favoritesBtn: UIButton!
    @IBOutlet weak var benefitsTitle: UILabel!
    @IBOutlet weak var benefitsText: UILabel!
    
    
    
    @IBAction func backBtnTouched(_ sender: Any) {
      print("Back Button Touched")
      parentVc?.showMainView(view: parentVc!.DetailsBenefits)
    }
    
    @IBAction func favoritesBtnTouched(_ sender: Any) {
        print("Favorites Button Touched")
    }
    
    @IBAction func benefitDetailsBtnTouched(_ sender: Any) {
        if let url = URL(string: "http://www.militaryonesource.mil") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
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
