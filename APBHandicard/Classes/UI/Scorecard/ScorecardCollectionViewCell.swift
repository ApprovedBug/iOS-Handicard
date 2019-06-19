//
//  ScorecardCollectionViewCell.swift
//  APBHandicard
//
//  Created by ApprovedBug on 14/06/2019.
//  Copyright © 2019 approvedbug. All rights reserved.
//

import UIKit
import APBCommon

class ScorecardCollectionViewCell: APBBaseCollectionViewCell {

    // MARK: - Subviews

    private lazy var holeNumber: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        return label
    }()

    private lazy var holeYardage: UILabel = {
        let label = UILabel()
        label.text = "346"
        label.textAlignment = .center
        return label
    }()

    private lazy var holePar: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.textAlignment = .center
        return label
    }()

    private lazy var holeStrokeIndex: UILabel = {
        let label = UILabel()
        label.text = "11"
        label.textAlignment = .center
        return label
    }()

    private lazy var playerScore: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.textAlignment = .center
        return label
    }()

    // MARK: - View setup

    override func setupSubviews() {

        backgroundColor = .red

        addSubview(holeNumber)
        addSubview(holeYardage)
        addSubview(holePar)
        addSubview(holeStrokeIndex)
        addSubview(playerScore)
    }

    override func setupAutolayout() {

        // hole number
        holeNumber.alignLeadingEdgeWithView(self, constant: 0)
        holeNumber.alignCenterYWithView(self, constant: 0)

        // hole yardage
        holeYardage.alignAttribute(.leading, WithView: holeNumber, Attribute: .trailing, constant: 0)
        holeYardage.alignCenterYWithView(self, constant: 0)
        holeYardage.constrainWidthWithView(holeNumber, constant: 0)

        // hole par
        holePar.alignAttribute(.leading, WithView: holeYardage, Attribute: .trailing, constant: 0)
        holePar.alignCenterYWithView(self, constant: 0)
        holePar.constrainWidthWithView(holeNumber, constant: 0)

        // hole stroke index
        holeStrokeIndex.alignAttribute(.leading, WithView: holePar, Attribute: .trailing, constant: 0)
        holeStrokeIndex.alignCenterYWithView(self, constant: 0)
        holeStrokeIndex.constrainWidthWithView(holeNumber, constant: 0)

        // player score
        playerScore.alignAttribute(.leading, WithView: holeStrokeIndex, Attribute: .trailing, constant: 0)
        playerScore.alignCenterYWithView(self, constant: 0)
        playerScore.alignTrailingEdgeWithView(self, constant: 0)
        playerScore.constrainWidthWithView(holeNumber, constant: 0)
    }
}
