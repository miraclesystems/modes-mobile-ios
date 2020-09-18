//
//  MainTabViewController.swift
//  modes-mobile-ios
//
//  Created by yada on 9/17/20.
//

import UIKit

class MainTabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        // Do any additional setup after loading the view.
    }
    
    // called whenever a tab button is tapped
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        if viewController is HomeViewController {
            print("First tab")
            var vc = viewController as! HomeViewController
            vc.viewDidLoad()
            vc.viewWillAppear(true)
            
        } else if viewController is MilLifeGuidesController {
            print("Second tab")
            var vc = viewController as! MilLifeGuidesController
            vc.viewDidLoad()
        }
        else if viewController is BenefitsController {
            print("third tab")
            var vc = viewController as! BenefitsController
            vc.viewDidLoad()
        }
        else if viewController is FavoritesViewController {
            print("fourth tab")
            var vc = viewController as! FavoritesViewController
            vc.viewDidLoad()
        }
        else if viewController is ConnectViewController {
            print("fifth tab")
            var vc = viewController as! ConnectViewController
            vc.viewDidLoad()
        }
        
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
