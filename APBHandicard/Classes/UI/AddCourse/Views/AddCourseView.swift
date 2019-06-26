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

    lazy var courseNameField: UITextField = {
        let field = UITextField()
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor 
        field.layer.cornerRadius = 5
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        field.leftView = paddingView
        field.leftViewMode = .always
        field.placeholder = "Course name"
        return field
    }()

    private lazy var teeHeader: UILabel = {
        let label = UILabel()
        label.text = "Tees"
        return label
    }()

    lazy var teeSelector: UISegmentedControl = {
        let view = UISegmentedControl(items: ["Championship", "Mens", "Ladies"])
        return view
    }()

    lazy var holeCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    // MARK: - View setup

    override func setupSubviews() {
        addSubview(courseNameField)
        addSubview(teeHeader)
        addSubview(teeSelector)
        addSubview(holeCollectionView)
    }

    override func setupAutolayout() {

        // course name field
        courseNameField.alignTopAndLeadingEdgesWithView(self, topConstant: 128, leadingConstant: 12)
        courseNameField.alignTrailingEdgeWithView(self, constant: -12)
        courseNameField.constrainHeight(32)

        // tee header
        teeHeader.alignAttribute(.top, WithView: courseNameField, Attribute: .bottom, constant: 12)
        teeHeader.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 12, trailingConstant: -12)

        // tee selector
        teeSelector.alignAttribute(.top, WithView: teeHeader, Attribute: .bottom, constant: 12)
        teeSelector.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 12, trailingConstant: -12)

        // hole collection view
        holeCollectionView.alignAttribute(.top, WithView: teeSelector, Attribute: .bottom, constant: 12)
        holeCollectionView.alignLeadingEdgeWithView(self, constant: 0)
        holeCollectionView.constrainWidthWithView(self, constant: 0)
        holeCollectionView.alignBottomEdgeWithView(self, constant: 0)
    }
}
