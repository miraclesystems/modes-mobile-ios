//
//  InAppBrowserVC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 9/4/20.
//

import UIKit
import WebKit


class InAppBrowserVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var urlString : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("On InAppBrowser")
        
        // Do any additional setup after loading the view.
        let url = URL(string: urlString!)
        webView.load(URLRequest(url: url!))
        
        
    }
    
    @IBAction func backButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
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
