//
//  LocTableViewController.swift


import UIKit

class LocTableViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgSrch: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblShowingInst: UILabel!
    @IBOutlet weak var lblInstallName: UILabel!
    @IBOutlet weak var btnRightTop: UIButton!
    
    
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
    
    @IBAction func navbtnTouched(_ sender: Any) {
       performSegue(withIdentifier: "unwindSegue", sender: title)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtName.paddingLeft(inset: 20)
        
        //Assign delegate  don't forget
         txtName.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        if fromGeoLoc {
            txtName.isHidden = true
            imgSrch.isHidden = true
            btnRightTop.setImage(UIImage(named: "search"), for: .normal)
        } else {
            lblShowingInst.isHidden = true
            lblInstallName.isHidden = true
            imgSrch.isHidden = true
            
        }
        
        print("namesArr:", namesArr)
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
   public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        //input text
       let searchText  = textField.text! + string
        //add matching text to arrays
        searchNamesArrRes = namesArr.filter { $0.range(of: textField.text!, options: .caseInsensitive) != nil }
        
        if(searchNamesArrRes.count == 0){
            searching = false
        }else{
            searching = true
        }
        self.tableView.reloadData();
        
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
        backWithData = true
        performSegue(withIdentifier: "unwindSegue", sender: title)
    }

    
    
}

