//
//  RightSideMenuVC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 9/8/20.
//

import Foundation
import UIKit

class RightSMTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // Here you can customize the appearance of your cell
    override func layoutSubviews() {
        super.layoutSubviews()
        // Customize imageView like you need
        //self.imageView?.frame = CGRect(x: 0,y: 0,width: 40,height: 40)
        //self.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        // Costomize other elements
        self.textLabel?.frame = CGRect(x: 30, y: 10, width: self.frame.width - 45, height: 20)
        self.imageView?.frame = CGRect(x: 2, y: 8, width: 4, height: 24)
        self.accessoryView?.frame = CGRect(x:30, y:16, width: 280, height: 1)
    }
}



class RightSideMenuVC: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet weak var viewforTable: UIView!
    @IBOutlet weak var btnClose: UIButton!
    
    
    @IBOutlet weak var viewforRightVertTwoCol: Right_VertTwoCollView!
    //Array of Page Titles
    let titles: [String] = ["my Military OneSource", "MilLife Guides", "Benefits", "Favorites", "Connect", "", "About my Military OneSource", "Settings", "Feedback", "", "Military OneSource Network"]
    
    
    var customView = UIView()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        
        let titleSize = titles.count
        
     
        tableView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isOpaque = false
        //tableView.backgroundColor = UIColor.green
        tableView.backgroundColor = UIColor.clear
        tableView.backgroundView = nil
        tableView.bounces = false
        return tableView
        }()
    
    @IBAction func btnCloseTouched(_ sender: Any) {
        sideMenuViewController?.hideMenuViewController()
    }
    
    //Social Media Buttons
    
    @IBAction func btnFaceBookTouched(_ sender: Any) {
        if let url = URL(string: "https://www.facebook.com/military.1source") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
    @IBAction func btnTwitterTouched(_ sender: Any) {
        if let url = URL(string: "https://twitter.com/military1source") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
    @IBAction func btnYouTubeTouched(_ sender: Any) {
        if let url = URL(string: "https://www.youtube.com/user/Military1Source") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
    @IBAction func btnPinterestTouched(_ sender: Any) {
        if let url = URL(string: "https://www.pinterest.com/military1source/") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
    @IBAction func btnInstagramTouched(_ sender: Any) {
        if let url = URL(string: "https://www.instagram.com/military1source/") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*
        if let tabBarController = self.sideMenuViewController!.contentViewController as? UITabBarController {
                let aboutVC = AboutVC()
                tabBarController.viewControllers?.insert(aboutVC, at: 5)
        }
        */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.sectionHeaderHeight = 5
       
        viewforTable.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 0, width: viewforTable.frame.size.width, height: viewforTable.frame.size.height)
        
        
        
   
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


// MARK : TableViewDataSource & Delegate Methods

extension RightSideMenuVC: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if ( indexPath.row == 5 || indexPath.row == 9 ) {
          return 20
        }
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: RightSMTableViewCell = RightSMTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
    
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "WorkSans-Regular", size: 14)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text  = titles[indexPath.row]
        cell.selectionStyle = .none
        
        //Bold the needed Labels
        if (cell.textLabel?.text == "my Military OneSource" ||
            cell.textLabel?.text == "About my Military OneSource" ||
            cell.textLabel?.text == "Settings" ||
            cell.textLabel?.text == "Feedback" ||
            cell.textLabel?.text == "Military OneSource Network" )
            {
             cell.textLabel?.font = UIFont(name: "WorkSans-Bold", size: 14)
        }
        
        cell.imageView?.image = UIImage(named: "menu_clear_indicator")
        //TODO: Setup for Navigation Indicator
        //cell.imageView?.image = UIImage(named: "menu_red_indicator")
        
        if indexPath.row == 10 {
            cell.imageView?.image = UIImage(named: "menu_clear_indicator")
        }
        
        //Setup for Dividers
        if cell.textLabel?.text == "" {
            cell.imageView?.image = UIImage(named: "menu_clear_indicator")
            cell.accessoryView = UIImageView(image: UIImage(named: "menu_divider"))
            
        }
            
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print (indexPath.row)
        
        if ( indexPath.row == 5 || indexPath.row == 9 || indexPath.row == 10 ) {
          return
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Handle Feedback web link
        if ( indexPath.row == 8 ) {
            if let url = URL(string: "https://www.militaryonesource.mil/") {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:])
                }
            }
            
          return
        }
        
        //Handle the About/Settings
        if (indexPath.row == 6) {
            let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "AboutVC") as! AboutVC
            self.present(vc, animated: true)
            sideMenuViewController?.hideMenuViewController()
            return
        }
        
        if (indexPath.row == 7) {
            let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
            self.present(vc, animated: true)
            sideMenuViewController?.hideMenuViewController()
            return
        }
        
        
        
        if let tabBarController = self.sideMenuViewController!.contentViewController as? UITabBarController {
            tabBarController.selectedIndex = indexPath.row
            sideMenuViewController?.hideMenuViewController()
        }
        
        
        
        
    }
 
    
    
    
}
