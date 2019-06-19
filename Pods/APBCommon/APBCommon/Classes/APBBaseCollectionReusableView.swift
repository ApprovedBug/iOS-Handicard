//
//  APBBaseCollectionReusableView.swift
//  APBCommon
//
//  Created by ApprovedBug on 17/06/2019.
//

import UIKit

open class APBBaseCollectionReusableView: UICollectionReusableView {

    // MARK: - Init Methods

    public convenience init() {
        self.init(frame: CGRect.zero)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public init(frame: CGRect) {
        
        super.init(frame: frame)

        setupSubviews()
        setupAutolayout()
    }

    // MARK: - View Setup

    open func setupSubviews() {

    }

    open func setupAutolayout() {

    }
}
