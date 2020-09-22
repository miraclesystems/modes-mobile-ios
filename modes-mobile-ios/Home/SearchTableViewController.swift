//
//  SearchTableViewController.swift
//  modes-mobile-ios
//

import UIKit

class SearchTableViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var viewModel : HomeViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgSrch: UIImageView!
    @IBOutlet weak var txtName: UITextField!

    var fromHomeCont1 = true
    
    var mySelection = ""
    var backWithData = false
    var searching:Bool = false
    var searchText = ""
    
    //from Geo Located
    var fromGeoLoc = false
    
    //data
    var namesArr = [String]()
    
    //filtered data from TextField
    var searchNamesArrRes = [String]()
    
    @IBAction func backbtnTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
  
    override func viewDidAppear(_ animated: Bool) {
     
        viewModel = HomeViewModel()
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(SearchTableViewController.keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SearchTableViewController.keyboardWillHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        txtName.becomeFirstResponder()
        
    }
    
    // MARK: Keyboard Notifications, for TableView Scroll Fix
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.2, animations: {
            // For some reason adding inset in keyboardWillShow is animated by itself but removing is not, that's why we have to use animateWithDuration here
            self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        })
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let txtFieldPosition = textField.convert(textField.bounds.origin, to: tableView)
        let indexPath = tableView.indexPathForRow(at: txtFieldPosition)
        if indexPath != nil {
            tableView.scrollToRow(at: indexPath!, at: .top, animated: true)
        }
        return true
    }
    */
    
    @IBAction func txtNameEditingChanged(_ sender: Any) {
        print("txtName = " + (txtName.text ?? ""))
        
        searchText  = (txtName.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        
        if(searchText.count >= 1) {
            searchNamesArrRes = viewModel?.getTopics(topic: searchText) as! [String]
            //searchNamesArrRes = namesArr.filter { $0.range(of: textField.text!, options: .caseInsensitive) != nil }
            
            if(searchNamesArrRes.count == 0) {
                searching = false
            } else {
                searching = true
            }
            self.tableView.reloadData();
        } else {
            searching = false
            self.tableView.reloadData();
        }
        
    }
    
//   public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
//        //input text
//
//       let searchText  = textField.text! + string
//        //add matching text to arrays
//
//        if(searchText.count >= 1){
//
//            searchNamesArrRes = viewModel?.getTopics(topic: searchText) as! [String]
//
//            //searchNamesArrRes = namesArr.filter { $0.range(of: textField.text!, options: .caseInsensitive) != nil }
//
//            if(searchNamesArrRes.count == 0){
//                searching = false
//            }else{
//                searching = true
//            }
//            self.tableView.reloadData();
//        }
//
//        return true
//    }
    
    
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if searchNamesArrRes.count == 0 && searchText.count > 0 {
            return 100
        } else {
            return 50
        }
        
    }

   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        var newFrame = headerView.frame
        newFrame.size.width = tableView.frame.width
        headerView.backgroundColor = UIColor(hex: 0xEFF4F7)

        let label = UILabel()
        label.frame = CGRect.init(x: 20, y: 5, width: headerView.frame.width-20, height: headerView.frame.height-10)
    
        if searching == true {
            label.font = UIFont(name: "WorkSans-Bold", size: 14)
            label.text = "TOPICS RELATED TO \"" + (searchText) + "\""
        } else {
            
            if searchNamesArrRes.count == 0 && searchText.count > 0 {
                newFrame.size.height = 100
                headerView.frame = newFrame
                label.frame = CGRect.init(x: 20, y: 5, width: headerView.frame.width-20, height: newFrame.size.height)
                label.numberOfLines = 4
                label.font = UIFont(name: "WorkSans-Regular", size: 14)
                label.text = "No results found for \"" + (searchText) + "\", search again or select a topic below. \n\n SUGGESTED TOPICS"
            } else {
                newFrame.size.height = 50
                headerView.frame = newFrame
                label.font = UIFont(name: "WorkSans-Bold", size: 14)
                label.text = "SUGGESTED TOPICS"
            }
    
        }
        
        label.textColor = UIColor(hex: 0x4A4A4A) // my custom colour
        headerView.addSubview(label)

        return headerView
   }
    
}


