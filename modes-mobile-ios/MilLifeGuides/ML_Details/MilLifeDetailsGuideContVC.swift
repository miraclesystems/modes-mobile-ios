//
//  MilLifeDetailsGuideContVC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 9/3/20.
//

import UIKit

class MilLifeDetailsGuideContVC: UIViewController {

    var parentVc : MilLifeGuidesController?
    
    //page elements
    @IBOutlet weak var favoritesBtn: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTextOverVIew: UILabel!
    
    @IBOutlet weak var lblArticles: UILabel!
    
    
    
    
    
    @IBAction func didTouchDetailsBackBtn(_ sender: Any) {
        parentVc?.showMainView(view: parentVc!.DetailsGuideCont)
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
