//
//  AddRoundView.swift
//  APBHandicard
//
//  Created by ApprovedBug on 14/06/2019.
//  Copyright © 2019 approvedbug. All rights reserved.
//

import UIKit
import APBCommon

class AddRoundView: APBBaseView {

    // MARK: - Subviews

    private lazy var selectCourseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select course", for: .normal)
        button.backgroundColor = .blue
        return button
    }()

    private lazy var scorecardView: ScorecardView = {
        let view = ScorecardView()
        return view
    }()

    // MARK: - View setup

    override func setupSubviews() {

        addSubview(selectCourseButton)
        addSubview(scorecardView)
    }

    override func setupAutolayout() {

        // select course button
        selectCourseButton.alignTopAndLeadingEdgesWithView(self, topConstant: 128, leadingConstant: 12)
        selectCourseButton.alignTrailingEdgeWithView(self, constant: -12)
        selectCourseButton.constrainHeight(32)

        // scorecard view
        scorecardView.alignAttribute(.top, WithView: selectCourseButton, Attribute: .bottom, constant: 24)
        scorecardView.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 12, trailingConstant: -12)
        scorecardView.constrainHeight(400)
    }
}
