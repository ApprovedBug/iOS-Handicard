//
//  AddCourseHoleBuilderView.swift
//  APBHandicard
//
//  Created by ApprovedBug on 19/06/2019.
//  Copyright © 2019 ApprovedBug. All rights reserved.
//

import UIKit
import APBCommon

protocol AddCourseHoleBuilderViewDelegate: NSObject {
    func parSelected(par: Int)
}

class AddCourseHoleBuilderView: APBBaseView, UITextFieldDelegate {

    // MARK: - Properties

    var delegate: AddCourseHoleBuilderViewDelegate?

    // MARK: - Subviews

    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    private lazy var parHeader: UILabel = {
        let label = UILabel()
        label.text = "Par"
        return label
    }()

    lazy var parSelector: UISegmentedControl = {
        let view = UISegmentedControl(items: ["3", "4", "5"])
        view.addTarget(self, action: #selector(parSelected), for: .valueChanged)
        return view
    }()

    private lazy var strokeIndexHeader: UILabel = {
        let label = UILabel()
        label.text = "Stroke index"
        return label
    }()

    private lazy var strokeIndexField: UITextField = {
        let field = UITextField()
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.cornerRadius = 5
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        field.leftView = paddingView
        field.leftViewMode = .always
        field.keyboardType = .numberPad
        field.delegate = self
        return field
    }()

    private lazy var yardsHeader: UILabel = {
        let label = UILabel()
        label.text = "Yards"
        return label
    }()

    private lazy var yardsField: UITextField = {
        let field = UITextField()
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.cornerRadius = 5
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        field.leftView = paddingView
        field.leftViewMode = .always
        field.keyboardType = .numberPad
        field.delegate = self
        return field
    }()

    // MARK: - View setup

    override func setupSubviews() {

        addSubview(separatorView)
        addSubview(parHeader)
        addSubview(parSelector)
        addSubview(strokeIndexHeader)
        addSubview(strokeIndexField)
        addSubview(yardsHeader)
        addSubview(yardsField)
    }

    override func setupAutolayout() {

        // separator view
        separatorView.alignTopAndLeadingEdgesWithView(self, topConstant: 0, leadingConstant: 0)
        separatorView.alignTrailingEdgeWithView(self, constant: 0)
        separatorView.constrainHeight(1)

        // hole par header
        parHeader.alignTopAndLeadingEdgesWithView(self, topConstant: 12, leadingConstant: 12)
        parHeader.alignTrailingEdgeWithView(self, constant: -12)

        // hole par selector
        parSelector.alignAttribute(.top, WithView: parHeader, Attribute: .bottom, constant: 12)
        parSelector.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 12, trailingConstant: -12)

        // stroke index header
        strokeIndexHeader.alignAttribute(.top, WithView: parSelector, Attribute: .bottom, constant: 12)
        strokeIndexHeader.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 12, trailingConstant: -12)

        // stroke index field
        strokeIndexField.alignAttribute(.top, WithView: strokeIndexHeader, Attribute: .bottom, constant: 12)
        strokeIndexField.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 12, trailingConstant: -12)
        strokeIndexField.constrainHeight(32)

        // yards header
        yardsHeader.alignAttribute(.top, WithView: strokeIndexField, Attribute: .bottom, constant: 12)
        yardsHeader.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 12, trailingConstant: -12)

        // yards field
        yardsField.alignAttribute(.top, WithView: yardsHeader, Attribute: .bottom, constant: 12)
        yardsField.alignLeadingAndTrailingEdgesWithView(self, leadingConstant: 12, trailingConstant: -12)
        yardsField.constrainHeight(32)
    }

    @objc func parSelected(sender: UISegmentedControl) {
        if let selectedTitle = sender.titleForSegment(at: sender.selectedSegmentIndex) {
            let par = Int(selectedTitle)!
            delegate?.parSelected(par: par)
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let maxLength: Int = textField == strokeIndexField ? 2 : 3
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}
