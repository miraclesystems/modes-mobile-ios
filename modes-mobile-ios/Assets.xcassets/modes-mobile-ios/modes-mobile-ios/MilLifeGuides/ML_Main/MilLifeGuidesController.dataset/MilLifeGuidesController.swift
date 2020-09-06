//
//  MilLifeGuidesController.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 9/1/20.
//

import UIKit

class MilLifeGuidesController: UIViewController {

    
    var viewModel : GuidesViewModel?
    
    @IBOutlet weak var btn_ByCat: UIButton!
    @IBOutlet weak var btn_ViewAll: UIButton!
    @IBOutlet weak var MilLifeContView1: UIView!
    @IBOutlet weak var MilLifeContView2: UIView!
    
    @IBOutlet weak var MainVIew: UIView!
    @IBOutlet weak var GuidesTableView: UIView!
    @IBOutlet weak var DetailsGuide: UIView!
    @IBOutlet weak var DetailsGuideCont: UIView!
    
    
    @IBOutlet weak var ml_guides_tableview: ML_Guides_TableView!
    
    
    
    @IBAction func btnViewAll_Touched(_ sender: Any) {
        print("btnView all touched")
        showViewAll()
    }
    
    @IBAction func btnByCat_Touched(_ sender: Any) {
        print("btnByCat tounched")
        showByCat()
    }
    
    @IBAction func btnShowGuidesTableTouched(_ sender: Any) {
        showOverlay(view: GuidesTableView)
    }
    @IBAction func btnShowGuidesDetails(_ sender: Any) {
        showOverlay(view: DetailsGuideCont)
    }
    
    @IBAction func backfromGuidesTouched(_ sender: Any) {
        showMainView(view: GuidesTableView)
    }
    @IBAction func btn_backfromDetailsTouched(_ sender: Any) {
        showMainView(view: DetailsGuideCont)
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
        
        
        if(view == DetailsGuide){
            vc3?.loadGuide()
        }
        let seconds = 0.1
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            let viewToAnimate2 = view
            view.isHidden = false
            UIView.animate(withDuration: 0.25){
                view.alpha = 1
            }
            
        }
    }
    
    
    
    
    
    
    func showGuidesDetails(){
        let seconds = 0.1
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            let viewToAnimate2 = self.DetailsGuideCont
            viewToAnimate2!.isHidden = false
            UIView.animate(withDuration: 0.25){
                viewToAnimate2!.alpha = 1
            }
            
        }
    }
    
    
    func showInAppBrowser(url: String){
        print("Back on Main showInAppBrowser with index: ", index)
        let storyBoard : UIStoryboard = UIStoryboard(name: "Navigation", bundle:nil)

        let nextVC = storyBoard.instantiateViewController(withIdentifier: "InAppBrowserVC") as! InAppBrowserVC
        nextVC.urlString = url
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated:true, completion:nil)
    }
    
    
    func showRelatedBenefits(index: Int){
        print("Back on Main showRelatedBenefits with index: ", index)
        tabBarController!.selectedIndex = 2
        
    }
    
    func showRelatedWebsites(urlString: String){
        print ("Back on Main showRelatedWEbsites with index: ", index)
        
        if let url = URL(string: urlString) {
                   if UIApplication.shared.canOpenURL(url) {
                       UIApplication.shared.open(url, options: [:])
                   }
               }
    }
    
    
    
    var vc1 : MilLifeByCatContVC?
    var vc2 : MilLifeViewAllContVC?
    var vc3 : MilLifeDetailsGuideContVC?
    
    override func viewDidLoad() {
        viewModel = GuidesViewModel()
        super.viewDidLoad()

                // set a reference back to the parent vc for contained view controllers
               // this is how the childeren should reference the view model
               for child in self.children{
                   
                   switch child{
                       
                   case is MilLifeByCatContVC:
                       vc1 = (child as! MilLifeByCatContVC)
                       (child as! MilLifeByCatContVC).parentVc = self
                       //(child as! MilLifeByCatContVC).ml_verttwocollview.parentVc = self
                   case is MilLifeViewAllContVC:
                       vc2 = (child as! MilLifeViewAllContVC)
                       (child as! MilLifeViewAllContVC).parentVc = self
                    
                   case is MilLifeDetailsGuideContVC:
                       vc3 = (child as! MilLifeDetailsGuideContVC)
                       (child as! MilLifeDetailsGuideContVC).parentVc = self
                   default:
                       break
                   }
               }
        
        
        //Hide Guides TableVIew
        GuidesTableView.isHidden = true
        DetailsGuideCont.isHidden = true
        
        showByCat()
    
    }
    
    override func viewDidAppear(_ animated: Bool){
        ml_guides_tableview.tableDataSource.parentVc = self
    }
    
    
    func showByCat(){
        btn_ByCat.isSelected = true
        btn_ViewAll.isSelected = false
        MilLifeContView1.isHidden = false
        MilLifeContView2.isHidden = true
    }
    
    func showViewAll(){
        btn_ByCat.isSelected = false
        btn_ViewAll.isSelected = true
        MilLifeContView1.isHidden = true
        MilLifeContView2.isHidden = false
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
