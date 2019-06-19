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

    override var rootView: AddCourseView? {
        get {
            if (_rootView == nil) {
                _rootView = AddCourseView()
            }
            return _rootView as? AddCourseView
        }
    }

}
