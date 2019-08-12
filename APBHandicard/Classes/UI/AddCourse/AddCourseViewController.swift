//
//  AddCourseViewController.swift
//  APBHandicard
//
//  Created by ApprovedBug on 19/06/2019.
//  Copyright © 2019 ApprovedBug. All rights reserved.
//

import UIKit
import APBCommon

enum TeeType {
    case championship
    case mens
    case ladies
}

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

        let holes = loadBlankHoles()
        holeCollectionViewDelegate.holes = holes
        rootView?.holeCollectionView.reloadData()
    }

    fileprivate func loadBlankHoles() -> [HoleDTO] {

        var holes = [HoleDTO]()

        for index in 1...18 {
            let hole = HoleDTO()
            hole.number = Int16(index)
            holes.append(hole)
        }

        return holes
    }

    // MARK: - Private functions

    fileprivate func saveCourse() {

        guard let courseName = rootView?.courseNameField.text,
            let selectedTeeIndex = rootView?.teeSelector.selectedSegmentIndex,
            let holes = holeCollectionViewDelegate.holes else {
                showValidationError()
                return
        }

        guard selectedTeeIndex >= 0,
            let selectedTee = rootView?.teeSelector.titleForSegment(at: selectedTeeIndex) else {
                return
        }

        if validateCourse(courseName: courseName, selectedTee: selectedTee, holes: holes) {

            let fullCourseName = "\(courseName) - \(selectedTee)"

            CourseRepository.saveCourse(context: managedObjectContext!, courseName: fullCourseName, holes: holes)
        } else {
            showValidationError()
        }
    }

    fileprivate func validateCourse(courseName: String, selectedTee: String, holes: [HoleDTO]) -> Bool {

        var isHolesValid = true

        for hole in holes {

            guard let holeNumber = hole.number,
                let holeStrokeIndex = hole.strokeIndex,
                let holePar = hole.par,
                let holeYards = hole.yards else {
                    isHolesValid = false
                    break
            }

            if holeStrokeIndex > 0 && holePar > 0 && holeYards > 0 && holeNumber > 0 {
                continue
            } else {
                isHolesValid = false
                break
            }
        }

        return !selectedTee.isEmpty && !courseName.isEmpty && isHolesValid
    }

    fileprivate func showValidationError() {
        let alert = UIAlertController(title: "Incomplete course",
                                      message: "Please make sure all details are filled in",
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        present(alert, animated: true, completion: nil)
    }
}

extension AddCourseViewController: AddCourseFooterViewDelegate {

    func saveTapped() {
        saveCourse()

        navigationController?.popViewController(animated: true)
    }
}
