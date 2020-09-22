//
//  SettingsVC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 9/9/20.
//

import UIKit

class SettingsVC: UIViewController {
    
    var viewModel : SettingsViewModel?
    var location : Location?
    var alert : UIAlertController? = nil
    var alerLoaded = false
    
    //For Sending Back to Previous Page
    var delegate : returntoPreviousProtocol?
    
    func callDelegate() {
        print("delegate called")
        delegate?.rtPM_GoUserSettings?()
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var lblRole: UILabel!
    @IBOutlet weak var lblInstallation: UILabel!
    @IBOutlet weak var lblBranch: UILabel!
    
    @IBOutlet weak var lblSettingsText: UILabel!
    
    
    @IBAction func backBtnTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editBtnTouched(_ sender: Any) {
        callDelegate()
        
    }
    
    func showError(error : String){
        
        let alert = UIAlertController(title: "", message: error, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
       

        self.present(alert, animated: true)
    }
    
    func hide(){
        self.alert?.dismiss(animated: true, completion: {
            
        })
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // instantiate the view model
        viewModel = SettingsViewModel()
        
        if(!(viewModel?.getInstallation())!){
            print("load no installation")
            /*
            constraintNoInstallationTop.constant = 31
                   constraintInstallationHeigth.constant = viewNoInstallation.frame.size.height
                   viewContentView.setNeedsLayout()
                   viewContentView.layoutIfNeeded()
                   
                   
                   viewInstallation.isHidden = true
                   viewNoInstallation.isHidden = false
            */
        }
        else{
            print("label text: ", lblInstallation.text)
            if(lblInstallation.text?.trimmingCharacters(in: .whitespaces) == "") && (viewModel!.hasDataError == false){
                if(alert == nil){
                    alert = UIAlertController(title: nil, message: "Loading Installation...", preferredStyle: .alert)
                }

                let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
                loadingIndicator.hidesWhenStopped = true
                loadingIndicator.style = UIActivityIndicatorView.Style.gray
                loadingIndicator.startAnimating();

                alert?.view.addSubview(loadingIndicator)
            
                if(!alert!.isBeingPresented){
                    DispatchQueue.main.async {
                        self.present((self.alert)!, animated: true, completion: {
                    
                        })
                    }
                }
            
            
                print("get the installation info")
                // observe the view model
                //viewNoInstallation.isHidden = true
                viewModel?.addObserver(self, forKeyPath: "dataLoaded", options: [.new,.old], context: nil)
                viewModel?.addObserver(self, forKeyPath: "hasDataError", options: [.new,.old], context: nil)
            }
            
        }

        
        
        lblRole.text = PreferencesUtil.shared.userDescription
        //lblInstallation.text = ""
        lblBranch.text = PreferencesUtil.shared.branch
        
        
        let mySettingsText = "The My Military OneSource app is personalized to you. Review or update your information below. \nYour information is used only within this app experience. If you delete the app your personalized settings will not be saved."
        
        let attributedString = NSMutableAttributedString(string: mySettingsText)

        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()

        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 4 // Whatever line spacing you want in points

        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        // *** Set Attributed String to your label ***
        lblSettingsText.attributedText = attributedString

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        
        print("observeValue is running")
        // the view model chaged
        if keyPath == "dataLoaded" && viewModel?.dataLoaded == true {
            sleep(1)
            DispatchQueue.main.async {
                    print("Do some stuff on the ui")
                    //Hide the Alert
                    self.hide()
                
                    /*
                    let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
                    if var topController = keyWindow?.rootViewController {
                        while let presentedViewController = topController.presentedViewController {
                            topController = presentedViewController
                        }
                    // topController should now be your topmost view controller
                    */
                
                    if self.viewModel?.locationsModel?.items?[0] != nil  {
                            print("It Exisits")
                            self.location = (self.viewModel?.locationsModel?.items?[0])! as Location
                            self.lblInstallation.text = self.location?.name
                    } else {
                            print("It is nil")
                    }
            }
                    
        }
        
        if keyPath == "hasDataError" && viewModel?.hasDataError == true {
            let seconds = 1.5
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                print("Something else happened, hide the alert")
                //Hide the Alert
                self.hide()
            }
        }
        
        
    }


}
