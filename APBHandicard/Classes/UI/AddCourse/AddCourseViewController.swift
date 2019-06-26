//
//  AddCourseViewController.swift
//  APBHandicard
//
//  Created by ApprovedBug on 19/06/2019.
//  Copyright © 2019 ApprovedBug. All rights reserved.
//

import UIKit
import APBCommon

class AddCourseViewController: APBBaseViewController {

    private lazy var holeCollectionViewDelegate: AddCourseHoleCollectionViewDelegate = {
        let delegate = AddCourseHoleCollectionViewDelegate()
        delegate.delegate = self
        return delegate
    }()

    override var rootView: AddCourseView? {
        get {
            if _rootView == nil {
                let rootView = AddCourseView()
                rootView.holeCollectionView.register(AddCourseHoleCollectionViewCell.classForCoder(),
                                        forCellWithReuseIdentifier: holeCollectionViewDelegate.cellReuseIdentifier)
                rootView.holeCollectionView.register(AddCourseFooterView.classForCoder(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: holeCollectionViewDelegate.footerReuseIdentifier)
                rootView.holeCollectionView.dataSource = holeCollectionViewDelegate
                rootView.holeCollectionView.delegate = holeCollectionViewDelegate
                _rootView = rootView
            }
            return _rootView as? AddCourseView
        }
    }

    override func loadData() {

        let holes = AddCourseRepository.loadBlankHoles()
        holeCollectionViewDelegate.holes = holes
        rootView?.holeCollectionView.reloadData()
    }
}

extension AddCourseViewController: AddCourseFooterViewDelegate {
    func saveTapped() {

        let courseName = rootView?.courseNameField.text
        let selectedTee = rootView?.teeSelector.titleForSegment(at: rootView!.teeSelector.selectedSegmentIndex)

        validateCourse(courseName: courseName, selectedTee: selectedTee, holes: holeCollectionViewDelegate.holes)
    }

    private func validateCourse(courseName: String?, selectedTee: String?, holes: [HoleDTO]?) {

    }
}
