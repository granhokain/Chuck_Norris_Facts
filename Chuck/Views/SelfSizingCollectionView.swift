//
//  SelfSizingCollectionView.swift
//  Chuck
//
//  Created by Rafael Martins on 30/10/19.
//  Copyright © 2019 Rafael Martins. All rights reserved.
//

import UIKit

final class SelfSizingCollectionView: UICollectionView {

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        startObservingContentSizeIfNeeded()
    }

    private func startObservingContentSizeIfNeeded() {
        guard superview != nil else { return }
        guard let badgeLayout = collectionViewLayout as? BadgeFlowLayout else { return }

        badgeLayout.didInvalidateLayout = { [weak self] _ in
            self?.invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: collectionViewLayout.collectionViewContentSize.height)
    }

}
