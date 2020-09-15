//  VertTwoCollView.swift

import UIKit

//@IBDesignable
class VertTwoCollView: UIView {
    
    
    let collectionDataSource = VertTwoCollDataSource()
    let flowLayout = VertTwoCollFlowLayout()
    var parentVc : HomeContView2VC?

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
        //bundle.loadNibNamed("VertTwoCollView", owner: self, options: nil)
        let bundle = Bundle(for: VertTwoCollView.self)
        bundle.loadNibNamed("VertTwoCollView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.layer.masksToBounds = false
        
        collectionDataSource.parentView = self
        initCollectionView()
        
        
        
        
    }
    
    private func initCollectionView() {
        let nib = UINib(nibName: "VertTwoCollCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "VertTwoCollCell")
        //collectionView.dataSource = self

        collectionView.delegate = collectionDataSource as UICollectionViewDelegate
        collectionView.dataSource = collectionDataSource
        collectionView.collectionViewLayout = flowLayout
        collectionView.contentInsetAdjustmentBehavior = .always
        
        
        
       
    }
}

