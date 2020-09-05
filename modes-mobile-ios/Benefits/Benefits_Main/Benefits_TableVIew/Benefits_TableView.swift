//  Benefits_TableView.swift

import UIKit

//@IBDesignable
class Benefits_TableView: UIView {
    
    //var viewModel : GuidesViewModel?
    let tableDataSource = Benefits_TableDataSource()
    //let flowLayout = Benefits_TableFlowLayout()

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
        let bundle = Bundle(for: Benefits_TableView.self)
        bundle.loadNibNamed("Benefits_TableView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        //contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.layer.masksToBounds = false
        
        initTableView()
        
       
        
        
    }
    
    private func initTableView() {
        //tableView.register(UINib(nibName: "LT_TableViewCell", bundle: nil), forCellReuseIdentifier: "ALCell")
        
        let nib = UINib(nibName: "Benefits_TableCell", bundle: nil)
        //tableView.register(nib, forCellWithReuseIdentifier: "Benefits_TableCell")
        tableView.register(nib, forCellReuseIdentifier: "Benefits_TableCell")
         
        //tableDataSource.viewModel = self.viewModel

        //tableView.dataSource = self
        tableView.dataSource = tableDataSource
        tableView.delegate = tableDataSource
    }
}

