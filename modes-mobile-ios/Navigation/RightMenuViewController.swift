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
        self.imageView?.frame = CGRect(x: 0,y: 0,width: 40,height: 40)
        self.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        // Costomize other elements
        self.textLabel?.frame = CGRect(x: 60, y: 10, width: self.frame.width - 45, height: 20)
    }
}

class RightMenuViewController: UIViewController {
    
    //Array of Page Titles
    let titles: [String] = ["First", "Second", "Third"]
    //Array of Page Images
    let images: [String] = ["first", "second", "third"]
    
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        let titleSize = titles.count
        let frameSizeWidth = self.view.frame.size.width
        let frameSizeHeight = self.view.frame.size.height
        let cor = CGFloat(54 * titleSize)
        
        if (self.view.frame.size.width <= 700){
            //iphone
            tableView.frame = CGRect(x: (frameSizeWidth / 2.0) - 60, y: (frameSizeHeight - cor - 140) / 2.0, width: (frameSizeWidth / 1.66), height: cor + 70)
            //tableView.frame = CGRect(x: (self.view.frame.size.width / 2.0) - 60, y: (self.view.frame.size.height - (54 * 3) - 140) / 2.0, width: (self.view.frame.size.width / 1.66), height: (54 * 3) + 70)  //54 * 3 + 70    3 is the number of items, 70 is the Header height
        } else {
            //ipad
            tableView.frame = CGRect(x: (frameSizeWidth / 2.0) - 60, y: (frameSizeHeight - cor - 140) / 2.0, width: (frameSizeWidth / 3.0 ), height: (cor) + 70)
            //tableView.frame = CGRect(x: (self.view.frame.size.width / 2.0) - 60, y: (self.view.frame.size.height - (54 * 3) - 140) / 2.0, width: (self.view.frame.size.width / 3.0 ), height: (54 * 3) + 70)  //54 * 3 + 70    3 is the number of items, 70 is the Header height
        }
        tableView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isOpaque = false
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
        self.tableView.sectionHeaderHeight = 70
        //view.backgroundColor = UIColor.clear
        view.backgroundColor = UIColor.black
        view.addSubview(tableView)
        
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
        let label = UILabel(frame: CGRect(x: 0, y: 20, width: 200, height: 50))
        let preferences = UserDefaults.standard
        label.text = preferences.object(forKey: "fullname") as? String
        label.textColor = UIColor.white
        label.font = UIFont(name: "Karla", size: 20)
        vw.addSubview(label)
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
        return 54
    }
    

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell: CustomTableViewCell = CustomTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        
        
        

        cell.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Karla", size: 18)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text  = titles[indexPath.row]
        cell.selectionStyle = .none
       
        cell.imageView?.image = UIImage(named: images[indexPath.row])
        

    
        
        //right align
        
        
         //cell.accessoryView = UIImageView(image: UIImage(named: images[indexPath.row]))
         //cell.accessoryView?.frame = CGRect(x:0, y:0, width: 22, height: 22)
        
        cell.contentView.transform = CGAffineTransform(scaleX: -1,y: 1);
        cell.imageView?.transform = CGAffineTransform(scaleX: -1,y: 1);
        cell.textLabel?.transform = CGAffineTransform(scaleX: -1,y: 1);
        cell.textLabel?.textAlignment = .right;
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        /*
        let navController: UINavigationController = (self.sideMenuViewController!.contentViewController as? UINavigationController)!
        */
        if let tabBarController = self.sideMenuViewController!.contentViewController as? UITabBarController {
            tabBarController.selectedIndex = indexPath.row
            sideMenuViewController?.hideMenuViewController()
            
        }
        
        
        
        
    }
 
    
    
    
}
    
