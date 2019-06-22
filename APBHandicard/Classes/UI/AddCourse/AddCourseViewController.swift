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
        return delegate
    }()

    private lazy var pickerDelegate: AddCourseStrokeIndexPickerDelegate = {
        let delegate = AddCourseStrokeIndexPickerDelegate()
        return delegate
    }()

    override var rootView: AddCourseView? {
        get {
            if _rootView == nil {
                let rootView = AddCourseView()
                rootView.holeCollectionView.register(AddCourseHoleCollectionViewCell.classForCoder(),
                                        forCellWithReuseIdentifier: holeCollectionViewDelegate.reuseIdentifier)
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
