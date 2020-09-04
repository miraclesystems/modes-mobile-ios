//
//  MilLifeDetailsGuideContVC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 9/3/20.
//

import UIKit

class MilLifeDetailsGuideContVC: UIViewController {

    var parentVc : MilLifeGuidesController?
    @IBOutlet weak var ml_articles_tableview: ML_Articles_TableView!
    @IBOutlet weak var ml_benefits_tableview: ML_Benefits_TableView!
    @IBOutlet weak var ml_websites_tableview: ML_Websites_TableView!
    @IBOutlet weak var ml_connect_tableview: ML_Connect_TableView!
    
    
    
    
    //page elements
    @IBOutlet weak var favoritesBtn: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTextOverVIew: UILabel!
    
    @IBOutlet weak var lblArticles: UILabel!
    @IBOutlet weak var btnMoreArticles: UIButton!
    
    @IBOutlet weak var lblBenefits: UILabel!
    @IBOutlet weak var btnMoreBenefits: UIButton!
    
    
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
        parentVc?.showMainView(view: parentVc!.DetailsGuideCont)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ml_articles_tableview.tableDataSource.parentVc = self
        ml_articles_tableview.tableView.reloadData()
        
        ml_benefits_tableview.tableDataSource.parentVc = self
        ml_benefits_tableview.tableView.reloadData()
        
        ml_websites_tableview.tableDataSource.parentVc = self
        ml_websites_tableview.tableView.reloadData()
        
        ml_connect_tableview.tableDataSource.parentVc = self
        ml_connect_tableview.tableView.reloadData()
        
        
        
        
        
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
