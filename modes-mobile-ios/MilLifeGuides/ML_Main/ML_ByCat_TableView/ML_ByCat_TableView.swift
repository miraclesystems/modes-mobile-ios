//  ML_ByCat_TableView.swift

import UIKit

//@IBDesignable
class ML_ByCat_TableView: UIView {
    
    var viewModel : HomeViewModel?
    let tableDataSource = ML_ByCat_TableDataSource()
    //let flowLayout = ML_ByCat_TableFlowLayout()

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        //let bundle = Bundle(for: type(of: self))
        let bundle = Bundle(for: ML_ByCat_TableView.self)
        bundle.loadNibNamed("ML_ByCat_TableView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        //contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.layer.masksToBounds = false
        
        initTableView()
        
       
        
        
    }
    
    private func initTableView() {
        //tableView.register(UINib(nibName: "LT_TableViewCell", bundle: nil), forCellReuseIdentifier: "ALCell")
        
        let nib = UINib(nibName: "ML_ByCat_TableCell", bundle: nil)
        //tableView.register(nib, forCellWithReuseIdentifier: "ML_ByCat_TableCell")
        tableView.register(nib, forCellReuseIdentifier: "ML_ByCat_TableCell")
         
        //tableDataSource.viewModel = self.viewModel

        //tableView.dataSource = self
        tableView.dataSource = tableDataSource
        tableView.delegate = tableDataSource
    }
}

