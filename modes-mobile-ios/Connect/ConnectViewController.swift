//
//  ConnectViewController.swift
//  modes-mobile-ios
//
//  Created by Joseph Sortino on 9/4/20.
//
import Foundation
import UIKit


class ConnectViewController: UIViewController {

    @IBOutlet weak var customNavBar: CustomNavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //link Hamburger Menu to View
        customNavBar.rightButton.addTarget(self, action: #selector(SSASideMenu.presentRightMenuViewController), for: UIControl.Event.touchUpInside)
        UIAccessibility.post(notification: UIAccessibility.Notification.layoutChanged, argument: self.customNavBar.leftButton)
        UIAccessibility.post(notification: UIAccessibility.Notification.screenChanged, argument: self.customNavBar.leftButton)
            
    }
    
    
    @IBAction func makeCall(_ sender: Any) {
             let phoneURL = URL(string: "tel://8003429647")!
          UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
      }


    @IBAction func internationalCalling(_ sender: Any) {
        let webUrl = URL(string: "https://www.militaryonesource.mil/international-calling-options")!
                                   UIApplication.shared.open(webUrl, options: [:], completionHandler: nil)
        
    }

    
    @IBAction func openWeblink(_ sender: Any) {
        let webUrl = URL(string: "https://www.militaryonesource.mil/")!
                 UIApplication.shared.open(webUrl, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func OpenSubscribeLink(_ sender: Any) {
        
           let webUrl = URL(string: "https://public.govdelivery.com/accounts/USDODMILITARYONESOURCE/subscriber/new?topic_id=USDODMILITARYONESOURCE_54")!
                     UIApplication.shared.open(webUrl, options: [:], completionHandler: nil)
        }
    
    
    @IBAction func OpenFacebook(_ sender: Any) {
        let webUrl = URL(string: "https://www.facebook.com/military.1source")!
                        UIApplication.shared.open(webUrl, options: [:], completionHandler: nil)
    }
    

    @IBAction func openTwitter(_ sender: Any) {
        let webUrl = URL(string: "https://twitter.com/military1source")!
                              UIApplication.shared.open(webUrl, options: [:], completionHandler: nil)
        
    }
    
    
    
  
    
    @IBAction func openYoutube(_ sender: Any) {
        let webUrl = URL(string: "https://www.youtube.com/user/Military1Source")!
                              UIApplication.shared.open(webUrl, options: [:], completionHandler: nil)
        
        
    }
    
    
    
    @IBAction func openInstagram(_ sender: Any) {
        let webUrl = URL(string: "https://www.instagram.com/military1source")!
                            UIApplication.shared.open(webUrl, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func openPinterest(_ sender: Any) {
        let webUrl = URL(string: "https://www.pinterest.com/military1source/")!
                            UIApplication.shared.open(webUrl, options: [:], completionHandler: nil)
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


