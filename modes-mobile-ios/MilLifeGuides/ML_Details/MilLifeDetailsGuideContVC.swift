//
//  MilLifeDetailsGuideContVC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 9/3/20.
//

import UIKit

class MilLifeDetailsGuideContVC: UIViewController {

    
    var selectedGuide : String?
    var parentVc : MilLifeGuidesController?
    
    var guide: Guide?
    @IBOutlet weak var ml_articles_tableview: ML_Articles_TableView!
    @IBOutlet weak var ml_benefits_tableview: ML_Benefits_TableView!
    @IBOutlet weak var ml_websites_tableview: ML_Websites_TableView!
    @IBOutlet weak var ml_connect_tableview: ML_Connect_TableView!
    
    //Constraint Heights
    @IBOutlet weak var constraintH_websites_tv: NSLayoutConstraint!
    @IBOutlet weak var constraintH_connect_tv: NSLayoutConstraint!
    
    @IBOutlet weak var lblExpertsHeader1: UILabel!
    
    @IBOutlet weak var lblExpertOverview: UILabel!
    
    
    //page elements
    @IBOutlet weak var favoritesBtn: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblTextOverVIew: UILabel!
    
    @IBOutlet weak var lblArticles: UILabel!
    @IBOutlet weak var btnMoreArticles: UIButton!
    
    @IBOutlet weak var lblBenefits: UILabel!
    @IBOutlet weak var btnMoreBenefits: UIButton!
    
    @IBOutlet weak var buttonFavorite: UIButton!
    @IBAction func touchFavorite(_ sender: Any) {
        
        ModesDb.shared.setGuideFavorite(favorite: !(guide?.favorite ?? false), name: (guide?.Guide)!)
        guide?.favorite = !(guide?.favorite ?? false)
        if((guide?.favorite ?? false)){
            buttonFavorite.setImage(UIImage.init(named: "favorites_red"), for: UIControl.State.normal)
            buttonFavorite.setBackgroundImage(UIImage.init(named: "favorites_red"), for: UIControl.State.normal)
        }
        else{
             buttonFavorite.setImage(UIImage.init(named: "favorite_unselected"), for: UIControl.State.normal)
            buttonFavorite.setBackgroundImage(UIImage.init(named: "favorite_unselected"), for:  UIControl.State.normal)
        }
        
    }
    
    func loadGuide()
    {
        
        guide = Guide()
        guide = parentVc?.viewModel?.getGuide()
        
        self.lblTitle.text = guide?.Guide
        self.lblHeader.text = guide?.GuideHeader
        self.lblTextOverVIew.text = guide?.Overview
        self.lblArticles.text = guide?.ArticleHeader
        self.btnMoreArticles.setTitle(guide?.MoreArticlesText, for: .normal)
        self.btnMoreBenefits.setTitle(guide?.MoreBenefitsText, for: .normal)
        
        
        ml_articles_tableview.tableDataSource.parentVc = self
        ml_articles_tableview.tableView.reloadData()

        ml_benefits_tableview.tableDataSource.parentVc = self
        ml_benefits_tableview.tableView.reloadData()

        ml_websites_tableview.tableDataSource.parentVc = self
        ml_websites_tableview.tableView.reloadData()

        ml_connect_tableview.tableDataSource.parentVc = self
        ml_connect_tableview.tableView.reloadData()
        
        
        lblExpertOverview.text = guide?.ExpertsHeader
        lblExpertsHeader1.text = guide?.ExpertsHeader1
        
        if((guide?.favorite ?? false)){
            buttonFavorite.setImage(UIImage.init(named: "favorites_red"), for: UIControl.State.normal)
            buttonFavorite.setBackgroundImage(UIImage.init(named: "favorites_red"), for: UIControl.State.normal)
        }
        else{
             buttonFavorite.setImage(UIImage.init(named: "favorite_unselected"), for: UIControl.State.normal)
            buttonFavorite.setBackgroundImage(UIImage.init(named: "favorite_unselected"), for:  UIControl.State.normal)
        }
        
        print("Debug")
        
        
    }
    
    
    
    func loadGuide1(){
        self.lblTitle.text = guide?.Guide
        self.lblHeader.text = guide?.GuideHeader
        self.lblTextOverVIew.text = guide?.Overview
        self.lblArticles.text = guide?.ArticleHeader
        self.btnMoreArticles.setTitle(guide?.MoreArticlesText, for: .normal)
        self.btnMoreBenefits.setTitle(guide?.MoreBenefitsText, for: .normal)
        
        
        ml_articles_tableview.tableDataSource.parentVc = self
        ml_articles_tableview.tableView.reloadData()

        ml_benefits_tableview.tableDataSource.parentVc = self
        ml_benefits_tableview.tableView.reloadData()

        ml_websites_tableview.tableDataSource.parentVc = self
        ml_websites_tableview.tableView.reloadData()

        ml_connect_tableview.tableDataSource.parentVc = self
        ml_connect_tableview.tableView.reloadData()
        
        
        lblExpertOverview.text = guide?.ExpertsHeader
        lblExpertsHeader1.text = guide?.ExpertsHeader1
        if((guide?.favorite ?? false)){
            buttonFavorite.setImage(UIImage.init(named: "favorites_red"), for: UIControl.State.normal)
            buttonFavorite.setBackgroundImage(UIImage.init(named: "favorites_red"), for: UIControl.State.normal)
        }
        else{
             buttonFavorite.setImage(UIImage.init(named: "favorite_unselected"), for: UIControl.State.normal)
            buttonFavorite.setBackgroundImage(UIImage.init(named: "favorite_unselected"), for:  UIControl.State.normal)
        }
        
        print("Debug")
        
    }
    
    
    @IBAction func didTouchbtnMoreArticles(_ sender: Any) {
        if let url = URL(string: "http://www.militaryonesource.mil") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    
    }
    
    @IBAction func didTouchbtnMoreBenefits(_ sender: Any) {
        if let url = URL(string: "http://www.militaryonesource.mil") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
        
    }
    
    @IBAction func callButtonTouched(_ sender: Any) {
        
        guard let number = URL(string: "tel://" + "8003429647") else { return }
        UIApplication.shared.open(number)
        
       
    }
    
    
    @IBAction func didTouchDetailsBackBtn(_ sender: Any) {
        
        if(!(selectedGuide?.isEmpty ?? true)){
            self.dismiss(animated: true) {
                
                
                NotificationCenter.default.post(name: Notification.Name("guide_closed"), object: nil)
                
            }
        }
        else{
            parentVc?.showMainView(view: parentVc!.DetailsGuideCont)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        if(!(selectedGuide?.isEmpty ?? true)){
            var viewModel = GuidesViewModel()
            viewModel.selectedGuide = selectedGuide!
            guide = viewModel.getGuide()
            loadGuide1()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(!(selectedGuide?.isEmpty ?? true)){
            var viewModel = GuidesViewModel()
            viewModel.selectedGuide = selectedGuide!
            guide = viewModel.getGuide()
            loadGuide1()
        }
        else{
            loadGuide()
        }
        ml_articles_tableview.tableDataSource.parentVc = self
        ml_articles_tableview.tableView.reloadData()
        
        ml_benefits_tableview.tableDataSource.parentVc = self
        ml_benefits_tableview.tableView.reloadData()
        
        ml_websites_tableview.tableDataSource.parentVc = self
        ml_websites_tableview.tableView.reloadData()
        
        ml_connect_tableview.tableDataSource.parentVc = self
        ml_connect_tableview.tableView.reloadData()
        
        //Constraint Heights
        var myWebTVCount = self.guide?.RelatedWebsitesText?.count
        print("Related WebSites Count: ", myWebTVCount)
        constraintH_websites_tv.constant = CGFloat(38 * (myWebTVCount ?? 1))
        
        var myConnectTVCount = self.guide?.ExpertsText?.count ?? 0
        print("Connection Count: ", myConnectTVCount)
        constraintH_connect_tv.constant = CGFloat(38 * (myConnectTVCount ?? 1))
        
        
        
        
        
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
