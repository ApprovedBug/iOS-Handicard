//
//  APBBaseViewController.swift
//  APBCommon
//
//  Created by ApprovedBug on 14/06/2019.
//

import UIKit

open class APBBaseViewController: UIViewController {

    // MARK: - Views

    public var _rootView: APBBaseView?

    open var rootView: APBBaseView? { return _rootView }

    // MARK: - View Life Cycle Methods

    override open func loadView() {
        super.loadView()

        if let view = self.rootView {
            view.backgroundColor = .white
            self.view = view
        }

        loadData()
    }

    // MARK: - Data Load

    open func loadData() {

    }

}
