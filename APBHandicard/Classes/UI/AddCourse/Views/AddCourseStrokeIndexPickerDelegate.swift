//
//  AddCourseStrokeIndexPickerDelegate.swift
//  APBHandicard
//
//  Created by ApprovedBug on 20/06/2019.
//  Copyright © 2019 ApprovedBug. All rights reserved.
//

import UIKit

class AddCourseStrokeIndexPickerDelegate: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 18
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
}
