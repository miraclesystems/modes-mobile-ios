//
//  AboutVC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 9/9/20.
//

import UIKit

class AboutVC: UIViewController {

    
    
    @IBOutlet weak var closeBtn: UIButton!
    
    @IBAction func closeBtnTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
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
