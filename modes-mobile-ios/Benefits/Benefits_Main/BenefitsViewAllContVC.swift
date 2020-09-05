//
//  BenefitsViewAllContVC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 9/1/20.
//

import UIKit

class BenefitsViewAllContVC: UIViewController {

    var parentVc : BenefitsController?
    @IBOutlet var benefits_viewall_tableview: Benefits_ViewAll_TableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        benefits_viewall_tableview.tableDataSource.parentVc = self
        benefits_viewall_tableview.tableView.reloadData()
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
