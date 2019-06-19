//
//  ScorecardView.swift
//  APBHandicard
//
//  Created by ApprovedBug on 14/06/2019.
//  Copyright © 2019 approvedbug. All rights reserved.
//

import UIKit
import APBCommon

class ScorecardView: APBBaseView {

    // MARK: - Subviews

    private lazy var outInSwitch: UISegmentedControl = {
        let view = UISegmentedControl(items: ["Front 9", "Back 9"])
        return view
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(ScorecardCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: collectionViewDelegate.cellResuseIdentifier)
        collectionView.register(ScorecardHeaderView.classForCoder(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: collectionViewDelegate.headerReuseIdentifier)
        collectionView.dataSource = collectionViewDelegate
        collectionView.delegate = collectionViewDelegate
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    private lazy var collectionViewDelegate: ScorecardCollectionViewDelegate = {
        let delegate = ScorecardCollectionViewDelegate()
        return delegate
    }()

    // MARK: - View setup

    override func setupSubviews() {
        addSubview(outInSwitch)
        addSubview(collectionView)
    }

    override func setupAutolayout() {

        // out in switch
        outInSwitch.alignTopAndLeadingEdgesWithView(self, topConstant: 0, leadingConstant: 0)
        outInSwitch.alignTrailingEdgeWithView(self, constant: 0)

        // collection view
        collectionView.alignAttribute(.top, WithView: outInSwitch, Attribute: .bottom, constant: 12)
        collectionView.alignLeadingEdgeWithView(self, constant: 0)
        collectionView.constrainWidthWithView(self, constant: 0)
        collectionView.alignBottomEdgeWithView(self, constant: 0)
    }
}
