//
//  BenefitsController.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 9/1/20.
//

import UIKit

class BenefitsController: UIViewController {

    
    //var viewModel : GuidesViewModel?
    
    @IBOutlet weak var btn_ByCat: UIButton!
    @IBOutlet weak var btn_ViewAll: UIButton!
    @IBOutlet weak var BenefitsContView1: UIView!
    @IBOutlet weak var BenefitsContView2: UIView!
    
    @IBOutlet weak var MainVIew: UIView!
    @IBOutlet weak var BenefitsTableView: UIView!
    @IBOutlet weak var DetailsBenefits: UIView!
    
    
    @IBOutlet weak var lblBenefitsHeader: UILabel!
    
    @IBOutlet weak var benefits_tableview: Benefits_TableView!
    
    
    
    @IBAction func btnViewAll_Touched(_ sender: Any) {
        print("btnView all touched")
        showViewAll()
    }
    
    @IBAction func btnByCat_Touched(_ sender: Any) {
        print("btnByCat tounched")
        showByCat()
    }
    
    @IBAction func btnShowBenefitsTableTouched(_ sender: Any) {
        showOverlay(view: BenefitsTableView)
    }
    @IBAction func btnShowBenefitsDetails(_ sender: Any) {
        showOverlay(view: DetailsBenefits)
    }
    
    @IBAction func backfromBenefitsTouched(_ sender: Any) {
        showMainView(view: BenefitsTableView)
    }
    @IBAction func btn_backfromDetailsTouched(_ sender: Any) {
        showMainView(view: DetailsBenefits)
    }
    
    func showMainView(view:UIView){
        let seconds = 0.1
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            let viewToAnimate2 = view
            UIView.animate(withDuration: 0.25){
                viewToAnimate2.alpha = 0
            }
            view.isHidden = true
        }
    }
    
    
    
    func showOverlay(view:UIView){
        let seconds = 0.1
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            let viewToAnimate2 = view
            view.isHidden = false
            UIView.animate(withDuration: 0.25){
                view.alpha = 1
            }
            
        }
    }
    
    
    
    
    
    
    func showBenefitsDetails(){
        let seconds = 0.1
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            let viewToAnimate2 = self.DetailsBenefits
            viewToAnimate2!.isHidden = false
            UIView.animate(withDuration: 0.25){
                viewToAnimate2!.alpha = 1
            }
            
        }
    }
    
    
    func showInAppBrowser(index: Int){
        print("Back on Main showInAppBrowser with index: ", index)
        let storyBoard : UIStoryboard = UIStoryboard(name: "Navigation", bundle:nil)

        let nextVC = storyBoard.instantiateViewController(withIdentifier: "InAppBrowserVC")
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated:true, completion:nil)
    }
    
    
    func showRelatedBenefits(index: Int){
        print("Back on Main showRelatedBenefits with index: ", index)
        tabBarController!.selectedIndex = 2
        
    }
    
    func showRelatedWebsites(index: Int){
        print ("Back on Main showRelatedWEbsites with index: ", index)
        
        if let url = URL(string: "http://www.militaryonesource.mil") {
                   if UIApplication.shared.canOpenURL(url) {
                       UIApplication.shared.open(url, options: [:])
                   }
               }
        
    }
    
    
    
    var vc1 : BenefitsByCatContVC?
    var vc2 : BenefitsViewAllContVC?
    var vc3 : BenefitsDetailsContVC?
    
    override func viewDidLoad() {
        //viewModel = GuidesViewModel()
        super.viewDidLoad()

                // set a reference back to the parent vc for contained view controllers
               // this is how the childeren should reference the view model
               for child in self.children{
                   
                   switch child{
                       
                   case is BenefitsByCatContVC:
                       vc1 = (child as! BenefitsByCatContVC)
                       (child as! BenefitsByCatContVC).parentVc = self
                       //(child as! BenefitsByCatContVC).benefits_verttwocollview.parentVc = self
                   case is BenefitsViewAllContVC:
                       vc2 = (child as! BenefitsViewAllContVC)
                       (child as! BenefitsViewAllContVC).parentVc = self
                   
                
                   case is BenefitsDetailsContVC:
                       vc3 = (child as! BenefitsDetailsContVC)
                       (child as! BenefitsDetailsContVC).parentVc = self
                
                   default:
                       break
                   }
               }
        
        
        //Hide Benefits TableVIew
        BenefitsTableView.isHidden = true
        DetailsBenefits.isHidden = true
        
        showByCat()
    
    }
    
    override func viewDidAppear(_ animated: Bool){
        benefits_tableview.tableDataSource.parentVc = self
    }
    
    
    func showByCat(){
        btn_ByCat.isSelected = true
        btn_ViewAll.isSelected = false
        BenefitsContView1.isHidden = false
        BenefitsContView2.isHidden = true
    }
    
    func showViewAll(){
        btn_ByCat.isSelected = false
        btn_ViewAll.isSelected = true
        BenefitsContView1.isHidden = true
        BenefitsContView2.isHidden = false
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
