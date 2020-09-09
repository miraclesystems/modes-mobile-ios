//  Right_VertTwoCollView.swift

import UIKit

//@IBDesignable
class Right_VertTwoCollView: UIView {
    
    let collectionDataSource = Right_VertTwoCollDataSource()
    //let flowLayout = Right_VertTwoCollFlowLayout()
    
    
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
        //bundle.loadNibNamed("Right_VertTwoCollView", owner: self, options: nil)
        let bundle = Bundle(for: Right_VertTwoCollView.self)
        bundle.loadNibNamed("Right_VertTwoCollView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.layer.masksToBounds = false
        
        
        
        initCollectionView()
        

    }
    
    private func initCollectionView() {
        let nib = UINib(nibName: "Right_VertTwoCollCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "Right_VertTwoCollCell")
        //collectionView.dataSource = self
        collectionView.dataSource = collectionDataSource
        //collectionView.collectionViewLayout = flowLayout
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.delegate = collectionDataSource
        //collectionDataSource.parentVc = parentVc
       
    }
}

