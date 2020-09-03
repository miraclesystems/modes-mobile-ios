//
//  FirstViewController.swift
//  ndgTabTest
//
//  Created by Neal Gentry on 8/24/20.
//  Copyright © 2020 Neal Gentry. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    


    var viewModel : HomeViewModel = HomeViewModel()
    
    @IBOutlet weak var homeTableView: HomeTableView!
    @IBOutlet weak var MainView1: UIView!
    @IBOutlet weak var MainView2: UIView!
    
    @IBOutlet weak var HomeContView1: UIView!
    @IBOutlet weak var HomeContView2: UIView!
    
    
    @IBOutlet weak var menubutton: UIButton!
    
    @IBOutlet weak var horzCollView: HorzCollView!
    
    
    var vc1 : HomeContView1VC?
    var vc2 : HomeContView2VC?
    
    @IBAction func didtouchbutton(_ sender: Any) {
        
    }
    
    @IBOutlet weak var testMenuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // pass the view model to the horzCollView
        
        //horzCollView.setViewModel(viewModel: viewModel)
        
        
        
        
        // set a reference back to the parent vc for contained view controllers
        // this is how the childeren should reference the view model
        for child in self.children{
            
            switch child{
                
            case is HomeContView1VC:
                vc1 = (child as! HomeContView1VC)
                (child as! HomeContView1VC).parentVc = self
                (child as! HomeContView1VC).horzCollView.collectionDataSource.viewModel = self.viewModel
            case is HomeContView2VC:
                vc2 = (child as! HomeContView2VC)
                (child as! HomeContView2VC).parentVc = self
            default:
                break
            }
        }
        
        
        //Hide the 2nd View on initial Load
        //HomeContView2.isHidden = true
        //HomeContView1.isHidden = false
        
        
        testMenuButton.addTarget(self, action: #selector(SSASideMenu.presentRightMenuViewController), for: UIControl.Event.touchUpInside)


        /*
        menubutton.addTarget(self, action: #selector(SSASideMenu.presentRightMenuViewController), for: UIControl.Event.touchUpInside)
        */
        // Do any additional setup after loading the view.
        /*
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
        */
        
    }
    
    override func viewWillAppear(_ Animated: Bool) {
        HomeContView2.isHidden = true
        HomeContView2.alpha = 0
        HomeContView1.isHidden = false
        HomeContView1.alpha = 1
        
        
        vc1?.horzCollView.collectionDataSource.viewModel = self.viewModel
        vc1?.horzCollView.collectionView.reloadData()
        
        
    }
    
    func didSelectHorzTile(index: Int){
        print("Back on Home with selection: ", index)
        let mySelCardType = viewModel.getSuggestedCards()[index].cardType
        
        
        switch mySelCardType {
        case "MILLIFE GUIDES":
                print("Guides")
                tabBarController!.selectedIndex = 1
            
        case "BENEFIT":
                print("Benefits")
                tabBarController!.selectedIndex = 2
            
        case "FAVORITES":
                print("Favorites")
                tabBarController!.selectedIndex = 3
        
        case "CONNECT":
                print("Connect")
                tabBarController!.selectedIndex = 4
        
        case "ABOUT US":
                print("About Us")
                //tabBarController!.selectedIndex = 4
           
        default:
            print("selected type: ", mySelCardType)
            
            
            
        }
        
    }
    
}

