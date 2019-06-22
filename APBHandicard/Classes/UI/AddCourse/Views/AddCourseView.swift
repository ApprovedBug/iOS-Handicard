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
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor 
        field.layer.cornerRadius = 5
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        field.leftView = paddingView
        field.leftViewMode = .always
        return field
    }()

    lazy var holeCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    // MARK: - View setup

    override func setupSubviews() {
        addSubview(courseNameHeader)
        addSubview(courseNameField)
        addSubview(holeCollectionView)
    }

    override func setupAutolayout() {

        // course name header
        courseNameHeader.alignTopAndLeadingEdgesWithView(self, topConstant: 128, leadingConstant: 12)
        courseNameHeader.alignTrailingEdgeWithView(self, constant: -12)

        // course name field
        courseNameField.alignAttribute(.top, WithView: courseNameHeader, Attribute: .bottom, constant: 12)
        courseNameField.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 12, trailingConstant: -12)
        courseNameField.constrainHeight(32)

        // hole collection view
        holeCollectionView.alignAttribute(.top, WithView: courseNameField, Attribute: .bottom, constant: 12)
        holeCollectionView.alignLeadingEdgeWithView(self, constant: 0)
        holeCollectionView.constrainWidthWithView(self, constant: 0)
        holeCollectionView.alignBottomEdgeWithView(self, constant: 0)
    }
}
