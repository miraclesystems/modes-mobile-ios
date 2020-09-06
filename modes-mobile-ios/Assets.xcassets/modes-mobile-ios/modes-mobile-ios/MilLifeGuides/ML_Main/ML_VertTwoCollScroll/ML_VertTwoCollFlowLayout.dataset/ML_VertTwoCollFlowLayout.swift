//  ML_VertTwoCollFlowLayout.swift

import UIKit

class ML_VertTwoCollFlowLayout: UICollectionViewFlowLayout {

    let activeDistance: CGFloat = 100
    let zoomFactor: CGFloat = 0

    override init() {
        super.init()

        scrollDirection = .vertical
        minimumLineSpacing = 16
        itemSize = CGSize(width: 156, height: 49)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func prepare() {
        /*
        guard let collectionView = collectionView else { fatalError() }
        let verticalInsets = (collectionView.frame.height - collectionView.adjustedContentInset.top - collectionView.adjustedContentInset.bottom - itemSize.height) / 2
        let horizontalInsets = (collectionView.frame.width - collectionView.adjustedContentInset.right - collectionView.adjustedContentInset.left - itemSize.width) / 10
        sectionInset = UIEdgeInsets(top: verticalInsets, left: horizontalInsets, bottom: verticalInsets, right: horizontalInsets)
        */
        sectionInset = UIEdgeInsets(top: 0, left: 34, bottom: 0, right: 34)
        super.prepare()
    }
    
    

}
