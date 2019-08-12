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

    fileprivate func search(text: String) {
        let courses = CourseRepository.course(context: managedObjectContext!, courseName: text)

        print("search run")
    }
}

extension SelectCourseViewController: SelectCourseViewDelegate {
    func addCourseTapped() {
        navigationController?.pushViewController(AddCourseViewController(managedObjectContext: managedObjectContext), animated: true)
    }

    func searchTextChanged(text: String?) {
        if let text = text,
            !text.isEmpty {
            search(text: text)
        }
    }
}
