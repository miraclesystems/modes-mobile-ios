//
//  FavoritesViewController.swift
//  modes-mobile-ios
//
//  Created by yada on 9/5/20.
//

import UIKit

class FavoritesViewController: UIViewController {

    var viewModel : FavoritesViewModel?
    var location : Location?
    
    @IBOutlet weak var viewNoGuides: UIView!
    @IBOutlet weak var viewNoBenefits: UIView!
    
   
    @IBOutlet weak var customNavBar: CustomNavigationBar!
    
    @IBOutlet weak var viewContentView: UIView!
    @IBOutlet weak var viewInstallation: UIView!
    
    @IBOutlet weak var viewMILLIFEGuides: UIView!
    
    @IBOutlet weak var viewNoInstallation: UIView!
    
    @IBOutlet weak var viewBenefits: UIView!
    @IBOutlet weak var constraintNoInstallationTop: NSLayoutConstraint!
    @IBOutlet weak var constraintInstallationHeigth: NSLayoutConstraint!
    
    
    /// installation info
    
    @IBOutlet weak var lblInstallationName: UILabel!
    @IBOutlet weak var lblBranch: UILabel!
    @IBOutlet weak var lblAddress1: UILabel!
    @IBOutlet weak var lblCityStateZip: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblWebsite: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    
    // tables
    
    @IBOutlet weak var tableViewGuides: UITableView!
    @IBOutlet weak var tableViewBenefits: UITableView!
    
    
    func showError(error : String){
        
        let alert = UIAlertController(title: "", message: error, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
       

        self.present(alert, animated: true)
    }
    
    func reloadTables(){
        self.tableViewBenefits.reloadData()
        self.tableViewGuides.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //link Hamburger Menu to View
        customNavBar.rightButton.addTarget(self, action: #selector(SSASideMenu.presentRightMenuViewController), for: UIControl.Event.touchUpInside)
        
        // instantiate the view model
        viewModel = FavoritesViewModel()
        
        
        
        if(!(viewModel?.getInstallation())!){
            print("load no installation")
            constraintNoInstallationTop.constant = 31
                   constraintInstallationHeigth.constant = viewNoInstallation.frame.size.height
                   viewContentView.setNeedsLayout()
                   viewContentView.layoutIfNeeded()
                   
                   
                   viewInstallation.isHidden = true
                   viewNoInstallation.isHidden = false
            
        }
        else{
            print("get the installation info")
            // observe the view model
            viewNoInstallation.isHidden = true
            viewModel?.addObserver(self, forKeyPath: "dataLoaded", options: [.new,.old], context: nil)
        }
        
       

        tableViewGuides.isEditing = false
        tableViewBenefits.isEditing = false
        
        tableViewGuides.dataSource = self
        tableViewGuides.delegate = self
        
        tableViewBenefits.delegate = self
        tableViewBenefits.dataSource = self
        
        tableViewGuides.tableFooterView = UIView()
        tableViewBenefits.tableFooterView = UIView()
        
        
        NotificationCenter.default.addObserver(
        self,selector: #selector(guideClosed),name: Notification.Name("guide_closed"),object: nil)
        
        NotificationCenter.default.addObserver(
        self,selector: #selector(benefitClosed),name: Notification.Name("benefit_closed"),object: nil)
        
       
        let emailGesture = UITapGestureRecognizer(target: self, action: #selector(emailClicked(_:)))
        lblEmail.addGestureRecognizer(emailGesture)
        
        let websiteGesture = UITapGestureRecognizer(target: self, action: #selector(websiteClicked(_:)))
        lblWebsite.addGestureRecognizer(websiteGesture)
        
        let phoneGesture = UITapGestureRecognizer(target: self, action: #selector(phoneClicked(_:)))
        lblPhoneNumber.addGestureRecognizer(phoneGesture)
        
       
    }
    
    @objc private func emailClicked(_ sender: UITapGestureRecognizer){
        
        var stUrl = "https://apps.militaryonesource.mil/MOS/f?p=AMS:5:0::::P5_APP_NAME,P5_MSG_TYPE,P5_EID:MilitaryINSTALLATIONS,Installation%20Address,\(location!.id!)"
        var error = false
        if(location?.email_address1 != nil && location?.email_address1?.count ?? 0 > 0){
            
            if let url = URL(string: "https://www.google.com") {
            //if let url = URL(string: location?.url1 ?? "") {
                
                
                UIApplication.shared.open(url)
            }
            else{
                error = true
            }
            
        }
        else{
            error = true
        }
        
        
        if(error){
            
            showError(error: "email not available")
        }
        
    }
    
    @objc private func websiteClicked(_ sender: UITapGestureRecognizer){
        
        var strUrl = "https://installations.militaryonesource.mil/military-installation/" + (location?.name_seo)! ?? ""
        var error = false
        if(location?.url1 != nil && location?.url1?.count ?? 0 > 0){
            
            
          
            if let url = URL(string: "https://" + (location?.url1!)!) {
                UIApplication.shared.open(url)
            }
            else{
                error = true
            }
            
        }
        else{
            error = true
        }
        
        
        if(error){
            
            showError(error: "Website can not be loaded")
        }
        
        
    }
    
    @objc private func phoneClicked(_ sender: UITapGestureRecognizer){
        
        var error = false
        if(location?.phone1 != nil && location?.phone1?.count ?? 0 > 0){
            
            
            if let url = URL(string: "TEL://" + (location?.phone1!)! ) {
                UIApplication.shared.open(url)
            }
            else{
                error = true
            }
            
        }
        else{
            error = true
        }
        
        
        if(error){
            
            showError(error: "phone number cannot be dialed")
        }
    }
    
    
    @objc private func guideClosed(notification: NSNotification){
        tableViewGuides.reloadData()
        //do stuff using the userInfo property of the notification object
    }
    @objc private func benefitClosed(notification: NSNotification){
        tableViewBenefits.reloadData()
        //do stuff using the userInfo property of the notification object
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableViewGuides.reloadData()
        tableViewBenefits.reloadData()
        
        
       
        UIAccessibility.post(notification: UIAccessibility.Notification.layoutChanged, argument: self.customNavBar.view)
        UIAccessibility.post(notification: UIAccessibility.Notification.screenChanged, argument: self.customNavBar.view)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
           
        // the view model chaged
        if keyPath == "dataLoaded" {
               DispatchQueue.main.async {
                    print("Do some stuff on the ui")
                    self.location = (self.viewModel?.locationsModel?.items?[0])! as Location
                
                    self.lblInstallationName.text = self.location?.name
                    self.lblBranch.text = self.location?.branch
                    self.lblAddress1.text = self.location?.address_line1
                    self.lblCityStateZip.text = "\(self.location?.city ?? ""), \(self.location?.stat_id ?? "")  \(self.location?.postal_code ?? "")"
                        
                        //self.lblEmail.text = location.email_address1
                        //self.lblWebsite.text = location.url1
                    self.lblPhoneNumber.text = self.location?.phone1
                }
        }
    }

}

extension FavoritesViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(tableView == self.tableViewGuides){
            
            if(viewModel?.getFavoriteGuides().count ?? 0 < 1){
                
                self.viewMILLIFEGuides.addSubview(viewNoGuides)
                tableViewGuides.isHidden = true
                viewNoGuides.isHidden = false
            }
            else{
                self.viewMILLIFEGuides.addSubview(tableViewGuides)
                viewNoGuides.isHidden = true
                tableViewGuides.isHidden = false
            }
            
            return viewModel?.getFavoriteGuides().count ?? 0
        }
        else{
            
            if(viewModel?.getFavoriteBenefits().count ?? 0 < 1){
                
                self.viewBenefits.addSubview(viewNoBenefits)
                tableViewBenefits.isHidden = true
                viewNoBenefits.isHidden = false
            }
            else{
                self.viewBenefits.addSubview(tableViewBenefits)
                viewNoBenefits.isHidden = true
                tableViewBenefits.isHidden = false
            }
            return viewModel?.getFavoriteBenefits().count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == self.tableViewGuides){

            // create a new cell if needed or reuse an old one
            let cell:FavoriteGuidesTableViewCell = self.tableViewGuides.dequeueReusableCell(withIdentifier: "GUIDES_CELL") as!  FavoriteGuidesTableViewCell
            cell.lblFavorite.text  = viewModel?.getFavoriteGuides()[indexPath.row].name
            
            cell.parentVc = self
            return cell
            
        }
        else{
            // create a new cell if needed or reuse an old one
            let cell:FavoritesBenefitsTableViewCell = self.tableViewBenefits.dequeueReusableCell(withIdentifier: "BENEFITS_CELL") as! FavoritesBenefitsTableViewCell
            
            // set the text from the data model
            cell.lblFavorite.text  = viewModel?.getFavoriteBenefits()[indexPath.row].name
            
            cell.parentVc = self
            
            return cell
            
        }
    }
    
    /*
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if(tableView == tableViewGuides){
            print("guid selected")
        }
        else{
            print("beenfits selected")
        }
        
    }
    */
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if(tableView == tableViewGuides){
            print("guid selected")
            
            let selectedGuide = viewModel?.getFavoriteGuides()[indexPath.row].name
            
            let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MilLifeDetailsGuideContVC") as! MilLifeDetailsGuideContVC
            
            vc.selectedGuide = selectedGuide
            self.present(vc, animated: true)
            
            
            
        }
        else{
            print("beenfits selected")
            
            let selectedBenefit = viewModel?.getFavoriteBenefits()[indexPath.row].name
            
            let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "BenefitsDetailsContVC") as! BenefitsDetailsContVC
            
            vc.selectedBenefit = selectedBenefit
            self.present(vc, animated: true)
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if(tableView == tableViewGuides){
           print("guid selected")
       }
       else{
           print("beenfits selected")
       }
    }
    
    
    
}
