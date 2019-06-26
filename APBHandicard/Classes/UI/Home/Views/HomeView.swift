//
//  HomeView.swift
//  APBHandicard
//
//  Created by ApprovedBug on 14/06/2019.
//  Copyright © 2019 approvedbug. All rights reserved.
//

import UIKit
import APBCommon

protocol HomeViewDelegate: NSObject {
    func addRoundTapped()
}

class HomeView: APBBaseView {

    // MARK: - Properties

    weak var delegate: HomeViewDelegate?

    // MARK: - Subviews

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, Handicard!"
        return label
    }()

    private lazy var addRoundButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add round", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(addRoundTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - View setup

    override func setupSubviews() {
        addSubview(titleLabel)
        addSubview(addRoundButton)
    }

    override func setupAutolayout() {

        // title label
        titleLabel.alignCenterXWithView(self, constant: 0)
        titleLabel.alignCenterYWithView(self, constant: 0)

        // add round button
        addRoundButton.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 12, trailingConstant: -12)
        addRoundButton.alignAttribute(.top, WithView: titleLabel, Attribute: .bottom, constant: 12)
        addRoundButton.constrainHeight(32)
    }

    // MARK: - Click handlers
    @objc func addRoundTapped(sender: UIButton) {
        delegate?.addRoundTapped()
    }
}
