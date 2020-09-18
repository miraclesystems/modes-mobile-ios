//  HorzCollView.swift

import UIKit

extension UIColor {
    static let myCustomColor = UIColor(red: 0.06, green: 0.15, blue: 0.22, alpha: 1.00)
}


//@IBDesignable
class HorzCollView: UIView {
    
    var viewModel : HomeViewModel?
    
    
    
    @IBOutlet weak var labelBrowseContent: UILabel!
    let collectionDataSource = HorzCollDataSource()
    //let flowLayout = HorzCollFlowLayout()

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionDataSource.viewModel = viewModel
        commonInit()
    }
    
    func setViewModel(viewModel : HomeViewModel){
        
        self.viewModel = viewModel
        collectionDataSource.viewModel = self.viewModel
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        //let bundle = Bundle(for: UserView.self)
        //bundle.loadNibNamed("UserView", owner: self, options: nil)
        let bundle = Bundle(for: HorzCollView.self)
        bundle.loadNibNamed("HorzCollView", owner: self, options: nil)
        //let bundle = Bundle(for: type(of: self))
        //bundle.loadNibNamed("HorzCollView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.backgroundColor = UIColor.myCustomColor
        collectionView.backgroundColor = UIColor.myCustomColor
        collectionDataSource.viewModel = self.viewModel        
        initCollectionView()
        
       
        
        
    }
    
    private func initCollectionView() {
        let nib = UINib(nibName: "HorzCollCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "HorzCollCell")
        
        //collectionView.dataSource = self
        collectionView.dataSource = collectionDataSource
        collectionView.delegate = collectionDataSource
        //collectionView.collectionViewLayout = flowLayout
        collectionView.contentInsetAdjustmentBehavior = .always
        
        //move 1st slide to left
        /*
        DispatchQueue.main.async {
                   let visibleItems: NSArray = self.collectionView.indexPathsForVisibleItems as NSArray
                   let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
                   let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
                   self.collectionView.scrollToItem(at: nextItem, at: .right, animated: false)
        }
        */
    }
}

