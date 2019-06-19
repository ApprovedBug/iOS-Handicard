//
//  HomeViewController.swift
//  APBHandicard
//
//  Created by ApprovedBug on 14/06/2019.
//  Copyright © 2019 approvedbug. All rights reserved.
//

import UIKit
import APBCommon

class HomeViewController: APBBaseViewController {

    // MARK: - Views
    
    override var rootView: HomeView? {
        get {
            if _rootView == nil {
                let rootView: HomeView = HomeView()
                rootView.delegate = self
                _rootView = rootView
            }

            return _rootView as? HomeView
        }
    }
}

extension HomeViewController: HomeViewDelegate {

    func addRoundTapped() {
        navigationController?.pushViewController(SelectCourseViewController(), animated: true)
    }
}
