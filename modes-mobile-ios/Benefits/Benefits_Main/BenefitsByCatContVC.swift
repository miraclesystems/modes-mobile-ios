//
//  BenefitsContView1VC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 9/1/20.
//

import UIKit

class BenefitsByCatContVC: UIViewController {

    var parentVc : BenefitsController?
    //@IBOutlet var benefits_verttwocollview: Benefits_VertTwoCollView!
    @IBOutlet var benefits_bycat_tableview: Benefits_ByCat_TableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //benefits_verttwocollview.parentVc = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //benefits_verttwocollview.collectionDataSource.parentVc = self
        //benefits_verttwocollview.collectionView.reloadData()
        benefits_bycat_tableview.tableDataSource.parentVc = self
        benefits_bycat_tableview.tableView.reloadData()
        
    }
    /*
    func showBenefitsTableonParent(){
        print("OnByCatVC")
        parentVc?.showOverlay(view: (parentVc?.DetailsGuideCont)!)
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
