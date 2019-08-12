//
//  APBBaseViewController.swift
//  APBCommon
//
//  Created by ApprovedBug on 14/06/2019.
//

import UIKit
import CoreData

open class APBBaseViewController: UIViewController {

    // MARK: - Properties

    public var managedObjectContext: NSManagedObjectContext?
    public var _rootView: APBBaseView?

    open var rootView: APBBaseView? { return _rootView }

    // MARK: - Init Methods

    public convenience init() {
        self.init(managedObjectContext: nil)
    }

    public init(managedObjectContext: NSManagedObjectContext?) {
        self.managedObjectContext = managedObjectContext
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

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
