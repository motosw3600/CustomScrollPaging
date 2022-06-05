//
//  CustomScrollPagingFlowLayout.swift
//  CustomScrollPaging
//
//  Created by 박상우 on 2022/06/05.
//

import UIKit

class CustomScrollPagingFlowLayout: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
                                      withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = self.collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset,
                                             withScrollingVelocity: velocity)
        }
        let itemWidth = itemSize.width + minimumInteritemSpacing
        
        let contentOffset = collectionView.contentOffset.x - collectionView.adjustedContentInset.left
        let currentOffset = proposedContentOffset.x - collectionView.adjustedContentInset.left
        let maxPage = Int(ceil((collectionView.contentSize.width
                                - collectionView.adjustedContentInset.left
                                - collectionView.adjustedContentInset.right) / itemWidth))
        var page = 0
        let contentPage = Int(round(contentOffset / itemWidth))
        let proposedPage = Int(round(currentOffset / itemWidth))
        if abs(velocity.x) < 2 {
            if abs(velocity.x) < 0.2 {
                page = contentPage
            } else if velocity.x < 0 {
                page = Int(ceil(contentOffset / itemWidth)) > 0 ? Int(ceil(contentOffset / itemWidth)) - 1 : 0
            } else {
                page = contentPage < maxPage ? contentPage + 1 : contentPage
            }
        } else {
            page = proposedPage
        }
        var offsetX = CGFloat(page) * itemWidth - collectionView.adjustedContentInset.left
        let minOffsetX = -collectionView.adjustedContentInset.left
        let maxOffsetX = CGFloat(maxPage) * itemWidth - collectionView.adjustedContentInset.left
        offsetX = max(min(offsetX, maxOffsetX), minOffsetX)
        return CGPoint(x: offsetX, y: proposedContentOffset.y)
    }
}

