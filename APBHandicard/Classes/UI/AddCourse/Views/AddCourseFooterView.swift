//
//  AddCourseFooterView.swift
//  APBHandicard
//
//  Created by ApprovedBug on 26/06/2019.
//  Copyright © 2019 ApprovedBug. All rights reserved.
//

import UIKit
import APBCommon

protocol AddCourseFooterViewDelegate: NSObject {
    func saveTapped()
}

class AddCourseFooterView: APBBaseCollectionReusableView {

    // MARK: - Properties

    weak var delegate: AddCourseFooterViewDelegate?

    // MARK: - Subviews

    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save course", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - View setup

    override func setupSubviews() {
        addSubview(saveButton)
    }

    override func setupAutolayout() {

        // save button
        saveButton.alignTopAndLeadingEdgesWithView(self, topConstant: 12, leadingConstant: 12)
        saveButton.alignBottomAndTrailingEdgesWithView(self, bottomConstant: -12, trailingConstant: -12)
    }

    // MARK: - Public functions

    @objc func saveTapped(sender: UIButton) {
        delegate?.saveTapped()
    }
}
