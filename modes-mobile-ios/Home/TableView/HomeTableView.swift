//  HomeTableView.swift

import UIKit

//@IBDesignable
class HomeTableView: UIView {
    
    var parentVc : HomeContView2VC?
    var viewModel : HomeViewModel?
    let tableDataSource = HomeTableDataSource()
    //let flowLayout = HomeTableFlowLayout()

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
        let bundle = Bundle(for: HomeTableView.self)
        bundle.loadNibNamed("HomeTableView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        //contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.layer.masksToBounds = false
        
        
        tableDataSource.parentView = self
        initTableView()
        
       
        
        
    }
    
    private func initTableView() {
        //tableView.register(UINib(nibName: "LT_TableViewCell", bundle: nil), forCellReuseIdentifier: "ALCell")
        
        let nib = UINib(nibName: "HomeTableCell", bundle: nil)
        //tableView.register(nib, forCellWithReuseIdentifier: "HomeTableCell")
        tableView.register(nib, forCellReuseIdentifier: "HomeTableCell")
         
        tableDataSource.viewModel = self.viewModel

        //tableView.dataSource = self
        tableView.dataSource = tableDataSource
        tableView.delegate = tableDataSource
    }
}

