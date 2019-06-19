//
//  ScorecardHeaderView.swift
//  APBHandicard
//
//  Created by ApprovedBug on 17/06/2019.
//  Copyright © 2019 ApprovedBug. All rights reserved.
//

import UIKit
import APBCommon

class ScorecardHeaderView: APBBaseCollectionReusableView {

    // MARK: - Subviews

    private lazy var holeNumber: UILabel = {
        let label = UILabel()
        label.text = "Hole"
        label.textAlignment = .center
        return label
    }()

    private lazy var holeYardage: UILabel = {
        let label = UILabel()
        label.text = "Yards"
        label.textAlignment = .center
        return label
    }()

    private lazy var holePar: UILabel = {
        let label = UILabel()
        label.text = "Par"
        label.textAlignment = .center
        return label
    }()

    private lazy var holeStrokeIndex: UILabel = {
        let label = UILabel()
        label.text = "S.I."
        label.textAlignment = .center
        return label
    }()

    private lazy var playerScore: UILabel = {
        let label = UILabel()
        label.text = "Score"
        label.textAlignment = .center
        return label
    }()

    // MARK: - View setup

    override func setupSubviews() {

        backgroundColor = .green
        
        addSubview(holeNumber)
        addSubview(holeYardage)
        addSubview(holePar)
        addSubview(holeStrokeIndex)
        addSubview(playerScore)
    }

    override func setupAutolayout() {

        // hole number
        holeNumber.alignCenterYWithView(self, constant: 0)
        holeNumber.alignLeadingEdgeWithView(self, constant: 0)
        holeNumber.alignBottomEdgeWithView(self, constant: 0)

        // hole yardage
        holeYardage.alignCenterYWithView(self, constant: 0)
        holeYardage.alignAttribute(.leading, WithView: holeNumber, Attribute: .trailing, constant: 0)
        holeYardage.alignBottomEdgeWithView(self, constant: 0)
        holeYardage.constrainWidthWithView(holeNumber, constant: 0)

        // hole par
        holePar.alignCenterYWithView(self, constant: 0)
        holePar.alignAttribute(.leading, WithView: holeYardage, Attribute: .trailing, constant: 0)
        holePar.alignBottomEdgeWithView(self, constant: 0)
        holePar.constrainWidthWithView(holeNumber, constant: 0)

        // hole stroke index
        holeStrokeIndex.alignCenterYWithView(self, constant: 0)
        holeStrokeIndex.alignAttribute(.leading, WithView: holePar, Attribute: .trailing, constant: 0)
        holeStrokeIndex.alignBottomEdgeWithView(self, constant: 0)
        holeStrokeIndex.constrainWidthWithView(holeNumber, constant: 0)

        // player score
        playerScore.alignCenterYWithView(self, constant: 0)
        playerScore.alignAttribute(.leading, WithView: holeStrokeIndex, Attribute: .trailing, constant: 0)
        playerScore.alignTrailingEdgeWithView(self, constant: 0)
        playerScore.alignBottomEdgeWithView(self, constant: 0)
        playerScore.constrainWidthWithView(holeNumber, constant: 0)
    }

}
