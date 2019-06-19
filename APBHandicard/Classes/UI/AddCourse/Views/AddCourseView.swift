//
//  AddCourseView.swift
//  APBHandicard
//
//  Created by ApprovedBug on 19/06/2019.
//  Copyright © 2019 ApprovedBug. All rights reserved.
//

import UIKit
import APBCommon

class AddCourseView: APBBaseView {

    // MARK: - Subviews

    private lazy var courseNameHeader: UILabel = {
        let label = UILabel()
        label.text = "Course name"
        return label
    }()

    private lazy var courseNameField: UITextField = {
        let field = UITextField()
        return field
    }()

    private lazy var holeBuilder: AddCourseHoleBuilderView = {
        let view = AddCourseHoleBuilderView()
        return view
    }()

    // MARK: - View setup

    override func setupSubviews() {
        addSubview(courseNameHeader)
        addSubview(courseNameField)
        addSubview(holeBuilder)
    }

    override func setupAutolayout() {

        // course name header
        courseNameHeader.alignTopAndLeadingEdgesWithView(self, topConstant: 128, leadingConstant: 12)
        courseNameHeader.alignTrailingEdgeWithView(self, constant: -12)

        // course name field
        courseNameField.alignAttribute(.top, WithView: courseNameHeader, Attribute: .bottom, constant: 12)
        courseNameField.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 12, trailingConstant: -12)

        // hole builder
        holeBuilder.alignBottomEdgeWithView(self, constant: 0)
        holeBuilder.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 0, trailingConstant: 0)
        holeBuilder.constrainHeight(320)
    }

}
