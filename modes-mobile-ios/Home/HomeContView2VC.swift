//
//  HomeContView2VC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 8/30/20.
//

import UIKit

class HomeContView2VC: UIViewController {

    @IBOutlet weak var labelSearchResults: UILabel!
    var parentVc : HomeViewController?
    
    @IBOutlet weak var vertTwoCellView: VertTwoCollView!
    @IBOutlet weak var homeTableView: HomeTableView!
    @IBOutlet weak var viewSpeakwith: UIView!
    @IBOutlet weak var callButton: UIButton!
    
    @IBAction func callButtonTouched(_ sender: Any) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        homeTableView.viewModel = self.parentVc?.viewModel
        labelSearchResults.text = "Showing Resuts for \"" + (self.parentVc?.viewModel.topic)! + "\""
        
        homeTableView.tableDataSource.viewModel = self.parentVc?.viewModel
        homeTableView.tableView.reloadData()
        
        
        
        vertTwoCellView.collectionDataSource.viewModel = self.parentVc?.viewModel
        vertTwoCellView.collectionView.reloadData()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

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

}
