//
//  HomeContView2VC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 8/30/20.
//

import UIKit

class HomeContView2VC: UIViewController {

    var parentVc : HomeViewController?
    
    @IBOutlet weak var viewSpeakwith: UIView!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var webLinkButton: UIButton!
    
    @IBAction func callButtonTouched(_ sender: Any) {
        
        guard let number = URL(string: "tel://" + "8003429647") else { return }
        UIApplication.shared.open(number)
        
       
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
