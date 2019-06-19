//
//  SelectCourseViewController.swift
//  APBHandicard
//
//  Created by ApprovedBug on 18/06/2019.
//  Copyright © 2019 ApprovedBug. All rights reserved.
//

import UIKit
import APBCommon

class SelectCourseViewController: APBBaseViewController {

    override var rootView: SelectCourseView? {
        get {
            if _rootView == nil {
                let rootView = SelectCourseView()
                rootView.delegate = self
                _rootView = rootView
            }

            return _rootView as? SelectCourseView
        }
    }
}

extension SelectCourseViewController: SelectCourseViewDelegate {
    func addCourseTapped() {
        navigationController?.pushViewController(AddCourseViewController(), animated: true)
    }
}
