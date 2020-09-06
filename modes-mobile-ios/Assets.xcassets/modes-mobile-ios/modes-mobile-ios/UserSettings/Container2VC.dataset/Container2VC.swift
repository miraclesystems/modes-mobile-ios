//
//  1ContainerVC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 8/21/20.
//

import UIKit



class Container2VC: UIViewController {

    @IBOutlet weak var btn_useLocation: UIButton!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    weak var delegate:ChildToParentProtocol? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_useLocation_Clicked(_ sender: Any) {
        print("Use Location Clicked")
        //Set Pref here
        
        delegate?.locSelected()
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
