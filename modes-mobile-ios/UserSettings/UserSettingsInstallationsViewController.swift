//
//  UserSettingsLocationsViewController.swift
//  modes-mobile-ios
//
//  Created by yada on 8/22/20.
//

import UIKit

class UserSettingsInstallationsViewController: UIViewController {

    var parentVc : UserSettingsViewController?
    
    let picker: UIPickerView = UIPickerView()
    
    var filteredArray = [String]()
    
    @IBOutlet weak var textLocatin: UITextField!
    
    @IBAction func touchLocation(_ sender: Any) {
    }

    @IBAction func touch1(_ sender: Any) {
       self.parentVc?.showPage1()
    }

    @IBAction func touch3(_ sender: Any) {
       self.parentVc?.showPage3()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        textLocatin.delegate = self
        
        
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
    
    
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        // we need to chars to search
        
        

    }
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
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



extension UserSettingsInstallationsViewController : UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(textField.text?.count ?? 0 > 2){
           
            let names = parentVc?.viewModel?.locationsModel.items!.map { $0!.name! }
            
            //let names = parentVc?.viewModel?.locationsModel.items.map { $0[0]}
            print(names)   //["Apples", "Banana", "Orange"]
            
            
            self.filteredArray = names!.filter { $0.range(of: textField.text!, options: .caseInsensitive) != nil }
            self.filteredArray.insert("", at: 0)
           
            picker.reloadAllComponents()
            picker.isHidden = false
            
            textField.resignFirstResponder()
         
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.filteredArray.count ?? 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
            let row = self.filteredArray[row]
            return row
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(row == 0){
            return
        }
        else{""
            textLocatin.text = self.filteredArray[row]
            pickerView.isHidden = true
            self.parentVc?.viewModel?.setInstallation(installation: textLocatin.text ?? "")
        }
        
    }
}
