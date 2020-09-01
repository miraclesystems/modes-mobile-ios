//
//  SearchTableViewController.swift
//  modes-mobile-ios
//

import UIKit

class SearchTableViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    
    
    var viewModel : HomeViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgSrch: UIImageView!
    @IBOutlet weak var txtName: UITextField!

    var fromHomeCont1 = true
    
    var mySelection = ""
    var backWithData = false
    var searching:Bool = false
    
    //from Geo Located
    var fromGeoLoc = false
    
    //data
    var namesArr = [String]()
    
    
    //filtered data from TextField
    var searchNamesArrRes = [String]()
    
    @IBAction func backbtnTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtName.paddingLeft(inset: 20)
        
        //Assign delegate  don't forget
         txtName.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        namesArr = ["COVID-19",
                    "Divorce",
                    "Relationships",
                    "Finances",
                    "Personal Finance",
                    "MilTax",
                    "Parenting & Child Care",
                    "MWR Digital Library",
                    "PCS",
                    "Deployment",
                    "Survivor Benefit",
                    "National Guard",
                    "Counseling",
                    "MyCAA"]
        
    
        
        print("namesArr:", namesArr)
        
        txtName.becomeFirstResponder()
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
       
    }
    
   public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        //input text
        
       let searchText  = textField.text! + string
        //add matching text to arrays
    
        if(searchText.count >= 3){
        
            searchNamesArrRes = viewModel?.getTopics(topic: searchText) as! [String]
            
            //searchNamesArrRes = namesArr.filter { $0.range(of: textField.text!, options: .caseInsensitive) != nil }
            
            if(searchNamesArrRes.count == 0){
                searching = false
            }else{
                searching = true
            }
            self.tableView.reloadData();
        }
        
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //check search text & original text
        if( searching == true){
            return searchNamesArrRes.count
        }else{
            return namesArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //check search text & original text
        if( searching == true){
            var mylabel = searchNamesArrRes[indexPath.row]
            cell.textLabel?.text = mylabel
        }else{
            var mylabel = namesArr[indexPath.row]
            cell.textLabel?.text = mylabel
            
        }
        
        return cell
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = tableView.cellForRow(at: indexPath as IndexPath)?.textLabel?.text
        print("title: ", title)
        mySelection = title!
       
        print("Running Click")
    
        self.viewModel?.topic = title!
        
        self.performSegue(withIdentifier: "unwindFromSearchTable", sender: title)
        
    
    
        
    }

   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = UIColor(hex: 0xEFF4F7)

        let label = UILabel()
        label.frame = CGRect.init(x: 10, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
    if searching == true {
        label.text = "TOPICS RELATED TO \"" + (txtName.text ?? "") + "\""
    } else {
        label.text = "SUGGESTED CONTENT"
    }
        label.font = UIFont.boldSystemFont(ofSize:14)
        label.textColor = UIColor(hex: 0x4A4A4A) // my custom colour
        headerView.addSubview(label)

        return headerView
   }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}


