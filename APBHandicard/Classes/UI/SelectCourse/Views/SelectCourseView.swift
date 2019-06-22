//
//  SelectCourseView.swift
//  APBHandicard
//
//  Created by ApprovedBug Group on 18/06/2019.
//  Copyright © 2019 ApprovedBug. All rights reserved.
//

import UIKit
import APBCommon

protocol SelectCourseViewDelegate: NSObject {
    func addCourseTapped()
}

class SelectCourseView: APBBaseView {

    // MARK: - Properties

    var delegate: SelectCourseViewDelegate?

    // MARK: - Subviews

    private lazy var searchField: UITextField = {
        let field = UITextField()
        return field
    }()

    private lazy var resultsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    private lazy var addCourseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Add Course", for: .normal)
        button.addTarget(self, action: #selector(addCourseTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - View setup

    override func setupSubviews() {
        addSubview(searchField)
        addSubview(resultsCollectionView)
        addSubview(addCourseButton)
    }

    override func setupAutolayout() {

        // search field
        searchField.alignTopAndLeadingEdgesWithView(self, topConstant: 128, leadingConstant: 12)
        searchField.alignTrailingEdgeWithView(self, constant: -12)

        // results collection view
        resultsCollectionView.alignAttribute(.top, WithView: searchField, Attribute: .bottom, constant: 12)
        resultsCollectionView.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 12, trailingConstant: -12)
        resultsCollectionView.alignBottomEdgeWithView(self, constant: 0)

        // add course button
        addCourseButton.alignBottomEdgeWithView(self, constant: -24)
        addCourseButton.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 12, trailingConstant: -12)
        addCourseButton.constrainHeight(32)
    }

    // MARK: - Public methods

    @objc func addCourseTapped(sender: UIButton) {
        delegate?.addCourseTapped()
    }
}
