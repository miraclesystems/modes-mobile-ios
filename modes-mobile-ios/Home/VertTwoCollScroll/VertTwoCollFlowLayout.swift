//  VertTwoCollFlowLayout.swift

import UIKit

class VertTwoCollFlowLayout: UICollectionViewFlowLayout {

    let activeDistance: CGFloat = 200
    let zoomFactor: CGFloat = 0

    override init() {
        super.init()

        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let containerWidth = screenWidth - 70 //20 insets on each side, 30 for middle column...20+20+30=70
        itemSize = CGSize(width: containerWidth/2, height: 58)
        scrollDirection = .vertical
        minimumLineSpacing = 15
        
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
        sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        super.prepare()
    }
    
    

}
