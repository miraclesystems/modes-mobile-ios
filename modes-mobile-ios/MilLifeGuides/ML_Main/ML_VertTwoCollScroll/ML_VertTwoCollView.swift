//  ML_VertTwoCollView.swift

import UIKit

//@IBDesignable
class ML_VertTwoCollView: UIView {
    
    let collectionDataSource = ML_VertTwoCollDataSource()
    let flowLayout = ML_VertTwoCollFlowLayout()

    var parentVc : MilLifeByCatContVC?
        
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
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
        //bundle.loadNibNamed("ML_VertTwoCollView", owner: self, options: nil)
        let bundle = Bundle(for: ML_VertTwoCollView.self)
        bundle.loadNibNamed("ML_VertTwoCollView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.layer.masksToBounds = false
        
        
        
        initCollectionView()
        

    }
    
    private func initCollectionView() {
        let nib = UINib(nibName: "ML_VertTwoCollCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ML_VertTwoCollCell")
        //collectionView.dataSource = self
        collectionView.dataSource = collectionDataSource
       // collectionView.collectionViewLayout = flowLayout
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.delegate = collectionDataSource
        collectionDataSource.parentVc = parentVc
       
    }
}

