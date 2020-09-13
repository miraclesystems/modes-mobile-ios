//
//  HomeContView2VC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 8/30/20.
//

import UIKit

class HomeContView2VC: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var labelSearchResults: UILabel!
    var parentVc : HomeViewController?
    
    @IBOutlet weak var vertTwoCellView: VertTwoCollView!
    @IBOutlet weak var homeTableView: HomeTableView!
    @IBOutlet weak var viewSpeakwith: UIView!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var webLinkButton: UIButton!
    
    //TableView and CollectionView Height Constraints on Home
    @IBOutlet weak var tvHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var colvHeightContraint: NSLayoutConstraint!
    
    
    @IBAction func callButtonTouched(_ sender: Any) {
        
        guard let number = URL(string: "tel://" + "8003429647") else { return }
        UIApplication.shared.open(number)
        
       
    }

    override func viewWillAppear(_ animated: Bool) {
        homeTableView.viewModel = self.parentVc?.viewModel
        labelSearchResults.text = "Showing Resuts for \"" + (self.parentVc?.viewModel.topic)! + "\""
        
        homeTableView.parentVc = self
        homeTableView.tableDataSource.viewModel = self.parentVc?.viewModel
        homeTableView.tableView.reloadData()
        
        vertTwoCellView.parentVc = self
        vertTwoCellView.collectionDataSource.viewModel = self.parentVc?.viewModel
        vertTwoCellView.collectionView.reloadData()
        
        //TableView and CollectionView Height based on number of articles
        let myTVCount = self.parentVc?.viewModel.getGuides(topic: self.parentVc?.viewModel.topic ?? "").count
        tvHeightConstraint.constant = CGFloat(90 * (myTVCount ?? 1))
        
        
        var myColVCount = self.parentVc?.viewModel.getBenefits(topic: self.parentVc?.viewModel.topic ?? "").count
        print("myColVCount: ", myColVCount)
        if !(myColVCount! % 2 == 0) {
            myColVCount = myColVCount! + 1
        }
        print("updated myColVCount: ", myColVCount)
        myColVCount = (myColVCount ?? 1)/2
        
        //myColVCount = round(myColVCount ?? 1)
        colvHeightContraint.constant = CGFloat(70 * (myColVCount ?? 1))
        
        
    }
        
        

    @IBAction func webLinkTouched(_ sender: Any) {
        if let url = URL(string: "http://www.militaryonesource.mil") {
                   if UIApplication.shared.canOpenURL(url) {
                       UIApplication.shared.open(url, options: [:])
                   }
               }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewSpeakwith.layer.cornerRadius = 5
        viewSpeakwith.layer.borderWidth = 0.0
        viewSpeakwith.layer.shadowColor = UIColor.black.cgColor
        viewSpeakwith.layer.shadowOffset = CGSize(width: 5, height: 5)
        viewSpeakwith.layer.shadowRadius = 5.0
        viewSpeakwith.layer.shadowOpacity = 0.1
        viewSpeakwith.layer.masksToBounds = false //<-
        
        
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
