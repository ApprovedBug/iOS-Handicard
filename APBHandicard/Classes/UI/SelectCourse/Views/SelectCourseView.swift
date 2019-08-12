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
    func searchTextChanged(text: String?)
}

class SelectCourseView: APBBaseView {

    // MARK: - Properties

    weak var delegate: SelectCourseViewDelegate?

    // MARK: - Subviews

    private lazy var searchField: UITextField = {
        let field = UITextField()
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.cornerRadius = 5
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        field.leftView = paddingView
        field.leftViewMode = .always
        field.placeholder = "Search courses"
        field.addTarget(self, action: #selector(searchTextChanged), for: .editingChanged)
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
        button.setTitle("Add new course", for: .normal)
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
        searchField.constrainHeight(32)

        // results collection view
        resultsCollectionView.alignAttribute(.top, WithView: searchField, Attribute: .bottom, constant: 12)
        resultsCollectionView.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 12, trailingConstant: -12)
        resultsCollectionView.alignBottomEdgeWithView(self, constant: 0)

        // add course button
        addCourseButton.alignBottomEdgeWithView(self, constant: -36)
        addCourseButton.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 12, trailingConstant: -12)
        addCourseButton.constrainHeight(32)
    }

    // MARK: - Public methods

    @objc func addCourseTapped(sender: UIButton) {
        delegate?.addCourseTapped()
    }

    @objc func searchTextChanged(sender: UITextField) {
        delegate?.searchTextChanged(text: sender.text)
    }
}
