//
//  AddRoundViewController.swift
//  APBHandicard
//
//  Created by ApprovedBug on 14/06/2019.
//  Copyright © 2019 approvedbug. All rights reserved.
//

import UIKit
import APBCommon

class AddRoundViewController: APBBaseViewController {

    // MARK: - Views

    override var rootView: AddRoundView? {
        get {
            if _rootView == nil {
                let rootView: AddRoundView = AddRoundView()
                _rootView = rootView
            }

            return _rootView as? AddRoundView
        }
    }
}
