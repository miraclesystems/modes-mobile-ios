//
//  1ContainerVC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 8/21/20.
//

import UIKit



class Container1VC: UIViewController {

    @IBOutlet weak var btn_ServiceMember: UIButton!
    @IBOutlet weak var btn_MilitarySpouse: UIButton!
    @IBOutlet weak var btn_FamilyMember: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    weak var delegate:ChildToParentProtocol? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_SerMem_Clicked(_ sender: Any) {
        print("Service Member Clicked")
        //Set Pref here
        
        delegate?.btn1Clicked()
    }
    
    @IBAction func btn_MilSpo_Clicked(_ sender: Any) {
        print("Miliatry Spouse Clicked")
        //Set Pref here
        
        delegate?.btn1Clicked()
    }
    
    @IBAction func btn_FamMem_Clicked(_ sender: Any) {
        print("Family Member Clicked")
        //Set Pref here
        
        delegate?.btn1Clicked()
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
