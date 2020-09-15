//
//  MilLifeContView1VC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 9/1/20.
//

import UIKit

class MilLifeByCatContVC: UIViewController {

    var parentVc : MilLifeGuidesController?
    @IBOutlet var ml_verttwocollview: ML_VertTwoCollView!
    @IBOutlet var ml_bycat_tableview: ML_ByCat_TableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //ml_verttwocollview.parentVc = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
      //  ml_verttwocollview.collectionDataSource.parentVc = self
      //  ml_verttwocollview.collectionView.reloadData()
        ml_bycat_tableview.tableDataSource.parentVc = self
        ml_bycat_tableview.tableView.reloadData()
    }
    /*
    func showGuidesTableonParent(){
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
