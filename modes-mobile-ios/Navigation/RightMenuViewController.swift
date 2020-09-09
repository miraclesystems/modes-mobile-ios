//
//  RightMenuViewController.swift


import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    
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
        self.imageView?.frame = CGRect(x: 0, y: 8, width: 4, height: 24)
    }
}

class RightMenuViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
    //Array of Page Titles
    let titles: [String] = ["my Military OneSource", "MilLife Guides", "Benefits", "Favorites", "Connect", "", "About my Military OneSource", "Settings", "Feedback", "", "Military OneSource Network"]
    //Array of Page Images
    let images: [String] = ["first", "second", "third", "one", "second"]
    
    var customView = UIView()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        
        let titleSize = titles.count
        let frameSizeWidth = self.view.frame.size.width
        let frameSizeHeight = self.view.frame.size.height
        let cor = CGFloat(35 * titleSize)
        
        if (self.view.frame.size.width <= 700){
            //iphone
            tableView.frame = CGRect(x:100, y: (frameSizeHeight - cor - 140) / 2.0, width: (frameSizeWidth), height: cor + 5)
            //tableView.frame = CGRect(x: (frameSizeWidth / 2.0) - 100, y: (frameSizeHeight - cor - 140) / 2.0, width: (frameSizeWidth), height: cor + 5)
            //tableView.frame = CGRect(x: (self.view.frame.size.width / 2.0) - 60, y: (self.view.frame.size.height - (54 * 3) - 140) / 2.0, width: (self.view.frame.size.width / 1.66), height: (54 * 3) + 70)  //54 * 3 + 70    3 is the number of items, 70 is the Header height
        } else {
            //ipad
            tableView.frame = CGRect(x: (frameSizeWidth / 2.0) - 60, y: (frameSizeHeight - cor - 140) / 2.0, width: (frameSizeWidth / 3.0 ), height: (cor) + 70)
            //tableView.frame = CGRect(x: (self.view.frame.size.width / 2.0) - 60, y: (self.view.frame.size.height - (54 * 3) - 140) / 2.0, width: (self.view.frame.size.width / 3.0 ), height: (54 * 3) + 70)  //54 * 3 + 70    3 is the number of items, 70 is the Header height
        }
        
        
        //tableView.frame = CGRect(x: 180, y: (self.view.frame.size.height - 54 * 2) / 2.0, width: self.view.frame.size.width, height: 54 * 2)
        
        tableView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isOpaque = false
        //tableView.backgroundColor = UIColor.green
        tableView.backgroundColor = UIColor.clear
        tableView.backgroundView = nil
        tableView.bounces = false
        return tableView
        }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.sectionHeaderHeight = 5
        //view.backgroundColor = UIColor.clear
        //view.backgroundColor = UIColor.black
        view.addSubview(tableView)
        
        customView.frame = CGRect.init(x: 0, y: 0, width: 100, height: 200)
        customView.backgroundColor = UIColor.black     //give color to the view
        customView.center = self.view.center
        self.view.addSubview(customView)
        
        let titleSize = titles.count
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


// MARK : TableViewDataSource & Delegate Methods

extension RightMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let vw = UIView()
        vw.backgroundColor = UIColor.clear
        let label = UILabel(frame: CGRect(x: 0, y: 20, width: 200, height: 5))
        //let preferences = UserDefaults.standard
        //label.text = preferences.object(forKey: "fullname") as? String
        //label.textColor = UIColor.white
        //label.font = UIFont(name: "system", size: 14)
        //vw.addSubview(label)
        return vw
        
    }
    /*
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell: CustomTableViewCell = CustomTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
    
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
       
        //cell.imageView?.image = UIImage(named: images[indexPath.row])
        cell.imageView?.image = UIImage(named: "menu_red_indicator")
    
        
        //right align
        
        
         //cell.accessoryView = UIImageView(image: UIImage(named: images[indexPath.row]))
         //cell.accessoryView?.frame = CGRect(x:0, y:0, width: 22, height: 22)
        
        /*
        cell.contentView.transform = CGAffineTransform(scaleX: -1,y: 1);
        cell.imageView?.transform = CGAffineTransform(scaleX: -1,y: 1);
        cell.textLabel?.transform = CGAffineTransform(scaleX: -1,y: 1);
        cell.textLabel?.textAlignment = .right;
        */
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print (indexPath.row)
        
        if ( indexPath.row == 5 || indexPath.row == 9 ) {
          return
        }
        /*
        let navController: UINavigationController = (self.sideMenuViewController!.contentViewController as? UINavigationController)!
        */
        
            tableView.deselectRow(at: indexPath, animated: true)
            if let tabBarController = self.sideMenuViewController!.contentViewController as? UITabBarController {
                tabBarController.selectedIndex = indexPath.row
                sideMenuViewController?.hideMenuViewController()
            }
        
        
        
        
    }
 
    
    
    
}
    
