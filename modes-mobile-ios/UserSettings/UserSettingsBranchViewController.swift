//
//  UserSettingsBranchViewController.swift
//  modes-mobile-ios
//
//  Created by yada on 8/22/20.
//

import UIKit

class UserSettingsBranchViewController: UIViewController {

    
    var picker = UIPickerView()
    @IBAction func touchSelect(_ sender: Any) {
        //set picker at bottom
        //TODO:  Is not allowing Touch events
        /*
        picker.leadingAnchor.constraint(equalTo: (self.parentVc?.view.safeAreaLayoutGuide.leadingAnchor)!).isActive = true
        picker.trailingAnchor.constraint(equalTo: (self.parentVc?.view.safeAreaLayoutGuide.trailingAnchor)!).isActive = true
        picker.bottomAnchor.constraint(equalTo: (self.parentVc?.view.safeAreaLayoutGuide.bottomAnchor)!).isActive = true
        */
        
        picker.isHidden = false
    }
    @IBOutlet weak var buttonSelect: UIButton!
    
    @IBAction func touch1(_ sender: Any) {
        self.parentVc?.showPage1()
    }
    
    @IBAction func touch2(_ sender: Any) {
        self.parentVc?.showPage2()
    }
    var parentVc : UserSettingsViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        picker.dataSource = self
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker)
        picker.isHidden = true
              
        picker.backgroundColor = UIColor.white

        
        picker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        picker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        picker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
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
            return
        }
        else{
            
            buttonSelect.setTitle(self.parentVc?.viewModel?.getBranches()[row], for:.normal)
            pickerView.isHidden = true
            self.parentVc?.viewModel?.setBranch(branch: (self.parentVc?.viewModel?.getBranches()[row])!)
            
        }
        
    }
}

