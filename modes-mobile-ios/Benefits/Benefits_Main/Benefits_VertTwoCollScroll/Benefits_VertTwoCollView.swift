//  Benefits_VertTwoCollView.swift

import UIKit

//@IBDesignable
class Benefits_VertTwoCollView: UIView {
    
    let collectionDataSource = Benefits_VertTwoCollDataSource()
    let flowLayout = Benefits_VertTwoCollFlowLayout()

    var parentVc : BenefitsByCatContVC?
        
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
        //bundle.loadNibNamed("Benefits_VertTwoCollView", owner: self, options: nil)
        let bundle = Bundle(for: Benefits_VertTwoCollView.self)
        bundle.loadNibNamed("Benefits_VertTwoCollView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.layer.masksToBounds = false
        
        
        
        initCollectionView()
        

    }
    
    private func initCollectionView() {
        let nib = UINib(nibName: "Benefits_VertTwoCollCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "Benefits_VertTwoCollCell")
        //collectionView.dataSource = self
        collectionView.dataSource = collectionDataSource
       // collectionView.collectionViewLayout = flowLayout
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.delegate = collectionDataSource
        collectionDataSource.parentVc = parentVc
       
    }
}

