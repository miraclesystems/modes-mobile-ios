//
//  BenefitsDetailsContVC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 9/3/20.
//

import UIKit

class BenefitsDetailsContVC: UIViewController {

    var selectedBenefit : String?
    var parentVc : BenefitsController?
    var benefit : Benefit?
   
    //page elements
    @IBOutlet weak var favoritesBtn: UIButton!
    @IBOutlet weak var benefitsTitle: UILabel!
    @IBOutlet weak var benefitsText: UILabel!
    
    @IBOutlet weak var buttonFavorite: UIButton!
    
    @IBAction func touchFavorie(_ sender: Any) {
        
        ModesDb.shared.setBenefitavorite(favorite: !(benefit?.favorite ?? false), name: (benefit?.Benefit)!)
        benefit?.favorite = !(benefit?.favorite ?? false)
        if((benefit?.favorite ?? false)){
            buttonFavorite.setImage(UIImage.init(named: "favorites_red"), for: UIControl.State.normal)
            buttonFavorite.setBackgroundImage(UIImage.init(named: "favorites_red"), for: UIControl.State.normal)
        }
        else{
            buttonFavorite.setImage(UIImage.init(named: "favorite_unselected"), for: UIControl.State.normal)
            buttonFavorite.setBackgroundImage(UIImage.init(named: "favorite_unselected"), for:  UIControl.State.normal)
        }
        
    }
    
    @IBAction func backBtnTouched(_ sender: Any) {
      print("Back Button Touched")
        if(selectedBenefit != nil){
            self.dismiss(animated: true) {
            
            }
        }
        else{
            parentVc?.showMainView(view: parentVc!.DetailsBenefits)
        }
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
    
    //override func viewDidAppear(_ animated: Bool) {
    override func viewWillAppear(_ animated: Bool) {
        
        if((selectedBenefit) != nil){
            
            var viewModel = BenefitsViewModel()
            viewModel.selectedBenefit = selectedBenefit!
            
            self.benefit = viewModel.getSelectedBenefit()
        }
        else{
        
            benefit = parentVc?.viewModel?.getSelectedBenefit()
        }
        self.benefitsTitle.text = benefit?.Benefit
        self.benefitsText.text = benefit?.LongDescription
        
        if((benefit?.favorite ?? false)){
            buttonFavorite.setImage(UIImage.init(named: "favorites_red"), for: UIControl.State.normal)
            buttonFavorite.setBackgroundImage(UIImage.init(named: "favorites_red"), for: UIControl.State.normal)
        }
        else{
            buttonFavorite.setImage(UIImage.init(named: "favorite_unselected"), for: UIControl.State.normal)
            buttonFavorite.setBackgroundImage(UIImage.init(named: "favorite_unselected"), for:  UIControl.State.normal)
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
