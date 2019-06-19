//
//  AddCourseHoleBuilderView.swift
//  APBHandicard
//
//  Created by ApprovedBug on 19/06/2019.
//  Copyright © 2019 ApprovedBug. All rights reserved.
//

import UIKit
import APBCommon

class AddCourseHoleBuilderView: APBBaseView {

    // MARK: - Subviews

    private lazy var parHeader: UILabel = {
        let label = UILabel()
        label.text = "Par"
        return label
    }()

    private lazy var parSelector: UISegmentedControl = {
        let view = UISegmentedControl(items: ["3", "4", "5"])
        return view
    }()

    // MARK: - View setup

    override func setupSubviews() {
        addSubview(parHeader)
        addSubview(parSelector)
    }

    override func setupAutolayout() {

        // hole par header
        parHeader.alignTopAndLeadingEdgesWithView(self, topConstant: 128, leadingConstant: 12)
        parHeader.alignTrailingEdgeWithView(self, constant: -12)

        // hole par selector
        parSelector.alignAttribute(.top, WithView: parHeader, Attribute: .bottom, constant: 12)
        parSelector.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 12, trailingConstant: -12)
        
    }
}
