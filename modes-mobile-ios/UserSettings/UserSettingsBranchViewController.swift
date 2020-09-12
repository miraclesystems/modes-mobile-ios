//
//  UserSettingsBranchViewController.swift
//  modes-mobile-ios
//
//  Created by yada on 8/22/20.
//

import UIKit

class UserSettingsBranchViewController: UIViewController {
    
    //Top Buttons
    @IBOutlet weak var indBtn1Branch: UIButton!
    @IBOutlet weak var indBtn2Branch: UIButton!
    @IBOutlet weak var indBtn3Branch: UIButton!

    
   // var picker = UIPickerView()
    
    @IBAction func touchSelect(_ sender: Any) {
        
        
        //set picker at bottom
        parentVc?.picker.leadingAnchor.constraint(equalTo: (self.parentVc?.view.safeAreaLayoutGuide.leadingAnchor)!).isActive = true
        parentVc?.picker.trailingAnchor.constraint(equalTo: (self.parentVc?.view.safeAreaLayoutGuide.trailingAnchor)!).isActive = true
        parentVc?.picker.bottomAnchor.constraint(equalTo: (self.parentVc?.view.safeAreaLayoutGuide.bottomAnchor)!).isActive = true
                   
        parentVc?.picker.isHidden = false
        parentVc?.btnBack.isHidden = true
        finishButton.isHidden = true
        
    }
    @IBOutlet weak var buttonSelect: UIButton!
    
    @IBAction func touch1(_ sender: Any) {
        self.parentVc?.showPage1()
    }
    
    @IBAction func touch2(_ sender: Any) {
        self.parentVc?.showPage2()
    }
    
    @IBOutlet weak var finishButton: UIButton!
    

    
    
    var parentVc : UserSettingsViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
                
        /*
        picker.delegate = self
        picker.dataSource = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker)
        picker.isHidden = true
        picker.backgroundColor = UIColor.white
        */
        finishButton.isHidden = true
              
        
        /*
        picker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        picker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        picker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
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
    @IBAction func finishButton(_ sender: Any) {
        self.parentVc?.viewContainer1.isHidden = true
        self.parentVc?.viewContainer2.isHidden = true
        self.parentVc?.viewContainer3.isHidden = true
        
        //setup Animated Gif
        let animatedGif = UIImage.gifImageWithName("animatedPreparing")
        self.parentVc?.preparingImage.image = animatedGif
        
        self.parentVc?.viewContainer4.isHidden = false
        self.parentVc?.btnBack.isHidden = true
        
        //Load the App after a delay
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            let storyboard = UIStoryboard(name: "Navigation", bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier: "sidemenu_sbid") as! SSASideMenu
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil);
        }
        
            
        
        
  
    }

}

//Moved Picker View to Parent VC, such that it is on Bottom of Screen receiving Touch Events
extension UserSettingsViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.viewModel?.getBranches().count ?? 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
            let row = self.viewModel?.getBranches()[row]
            return row
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        for case let vc3 as UserSettingsBranchViewController in self.children {
            
            btnBack.isHidden = false
            pickerView.isHidden = true
            
            if(row == 0){
                vc3.indBtn3Branch.setBackgroundImage(UIImage(named:"selector_highlighted"), for: .normal)
                vc3.indBtn3Branch.setTitle("3", for: .normal)
                self.threeComplete = false
                vc3.buttonSelect.setTitle(self.viewModel?.getBranches()[row], for:.normal)
                vc3.finishButton.isHidden = true
                return
                
            } else {
                
                vc3.buttonSelect.setTitle(self.viewModel?.getBranches()[row], for:.normal)
                vc3.parentVc?.viewModel?.setBranch(branch: (self.viewModel?.getBranches()[row])!)
                vc3.indBtn3Branch.setBackgroundImage(UIImage(named:"selector_checked"), for: .normal)
                vc3.indBtn3Branch.setTitle("", for: .normal)
                self.threeComplete = true
                vc3.finishButton.isHidden = false
                
            }
        }
    }
    
    
}

/*  //Original Picker in Branch Class
 extension UserSettingsBranchViewController : UIPickerViewDelegate, UIPickerViewDataSource{
     
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
     }
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         
         return self.parentVc?.viewModel?.getBranches().count ?? 0
     }
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
             let row = self.parentVc?.viewModel?.getBranches()[row]
             return row
     }
     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         
         if(row == 0){
             self.indBtn3Branch.setBackgroundImage(UIImage(named:"selector"), for: .normal)
             self.indBtn3Branch.setTitle("3", for: .normal)
             self.parentVc?.threeComplete = false
             
             buttonSelect.setTitle(self.parentVc?.viewModel?.getBranches()[row], for:.normal)
             pickerView.isHidden = true
             
             return
         }
         else{
             
             buttonSelect.setTitle(self.parentVc?.viewModel?.getBranches()[row], for:.normal)
             pickerView.isHidden = true
             self.parentVc?.viewModel?.setBranch(branch: (self.parentVc?.viewModel?.getBranches()[row])!)
             
             self.indBtn3Branch.setBackgroundImage(UIImage(named:"selector_checked"), for: .normal)
             self.indBtn3Branch.setTitle("", for: .normal)
             self.parentVc?.threeComplete = true
             

             
             finishButton.isHidden = false
             

        
             
         }
         
     }
     
     
 }

 */

