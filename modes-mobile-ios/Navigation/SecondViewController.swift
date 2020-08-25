//
//  SecondViewController.swift
//  ndgTabTest
//
//  Created by Neal Gentry on 8/24/20.
//  Copyright © 2020 Neal Gentry. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

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


}

