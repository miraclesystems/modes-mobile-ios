//
//  UserSettingsViewController.swift
//  modes-mobile-ios
//
//  Created by yada on 8/20/20.
//

import UIKit

protocol ChildToParentProtocol:class {
    func btn1Clicked()
    func locSelected()
    func branchSelected()
    func needToPassInfoToParent(with value:Int)
}


class UserSettingsViewController: UIViewController {

    @IBOutlet weak var ContainerView1: UIView!
    @IBOutlet weak var ContainerView2: UIView!
    @IBOutlet weak var ContainerView3: UIView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let vc1 = segue.destination as? Container1VC,
                segue.identifier == "USto1" {
                vc1.delegate = self
            }
            if let vc2 = segue.destination as? Container2VC,
                segue.identifier == "USto2" {
                vc2.delegate = self
            }
            if let vc3 = segue.destination as? Container3VC,
                segue.identifier == "USto3" {
                vc3.delegate = self
            }
        
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

extension UserSettingsViewController:ChildToParentProtocol {

    func btn1Clicked() {
        print("On ParentVC")
        ContainerView1.isHidden = true
    }
    func locSelected() {
        print("On ParentVC, locSelected")
        ContainerView2.isHidden = true
    }
    func branchSelected(){
    
    }
    
    func needToPassInfoToParent(with value:Int) {

    }
}
