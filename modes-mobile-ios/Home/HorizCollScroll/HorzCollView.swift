//  HorzCollView.swift

import UIKit

@IBDesignable
class HorzCollView: UIView {
    
    let collectionDataSource = HorzCollDataSource()
    let flowLayout = HorzCollFlowLayout()

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
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("HorzCollView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        initCollectionView()
    }
    
    private func initCollectionView() {
        let nib = UINib(nibName: "HorzCollCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "HorzCollCell")
        //collectionView.dataSource = self
        collectionView.dataSource = collectionDataSource
        collectionView.collectionViewLayout = flowLayout
        collectionView.contentInsetAdjustmentBehavior = .always
        
        
    }
}

