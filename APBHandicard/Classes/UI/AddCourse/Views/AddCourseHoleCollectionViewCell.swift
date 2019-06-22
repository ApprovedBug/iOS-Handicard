//
//  AddCourseHoleCollectionViewCell.swift
//  APBHandicard
//
//  Created by ApprovedBug on 20/06/2019.
//  Copyright © 2019 ApprovedBug. All rights reserved.
//

import UIKit
import APBCommon

protocol AddCourseHoleCollectionViewCellDelegate: NSObject {
    func holeParSelected(hole: HoleDTO, par: Int)
}

class AddCourseHoleCollectionViewCell: APBBaseCollectionViewCell, AddCourseHoleBuilderViewDelegate {

    // MARK: - Properties

    var hole: HoleDTO? {
        didSet {
            updateUI()
        }
    }

    // MARK: - Subviews

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    lazy var builderView: AddCourseHoleBuilderView = {
        let view = AddCourseHoleBuilderView()
        view.delegate = self
        return view
    }()

    // MARK: - View setup

    override func setupSubviews() {
        addSubview(titleLabel)
        addSubview(builderView)
    }

    override func setupAutolayout() {

        // title label
        titleLabel.alignTopAndLeadingEdgesWithView(self, topConstant: 12, leadingConstant: 12)

        // builder view
        builderView.alignAttribute(.top, WithView: titleLabel, Attribute: .bottom, constant: 12)
        builderView.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 0, trailingConstant: 0)
        builderView.constrainHeight(260)
    }

    // MARK: - Private functions

    private func updateUI() {

        if let hole = hole {
            titleLabel.text = "Hole \(hole.number!)"

            if let par = hole.par {
                for index in 0...builderView.parSelector.numberOfSegments {
                    let segmentTitle = builderView.parSelector.titleForSegment(at: index)
                    let segmentPar = Int(segmentTitle!)

                    if segmentPar == par {
                        builderView.parSelector.selectedSegmentIndex = index
                        break
                    }
                }
             }
        }
    }

    // MARK: - Public functions

    override func prepareForReuse() {
        builderView.parSelector.selectedSegmentIndex = UISegmentedControl.noSegment
    }

    // MARK: - AddCourseHoleBuilderViewDelegate

    func parSelected(par: Int) {

        hole?.par = par
    }
}
