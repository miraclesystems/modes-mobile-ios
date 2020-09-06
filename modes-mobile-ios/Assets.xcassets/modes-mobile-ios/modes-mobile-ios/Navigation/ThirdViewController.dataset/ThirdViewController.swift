//
//  ThirdViewController.swift
//  

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //  This loads the hamburger menu on the right side
        self.navigationController?.navigationBar.tintColor = UIColor.black
        //create a new button
        let button = UIButton.init(type: .custom)
        //set image for button
        button.setImage(UIImage(named: "navbar_menu"), for: UIControl.State.normal)
        //add function for button
        button.addTarget(self, action: #selector(SSASideMenu.presentRightMenuViewController), for: UIControl.Event.touchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.rightBarButtonItem = barButton
        // self.navigationController?.navigationBar.tintColor = UIColor(hex: 0xA74795)
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
