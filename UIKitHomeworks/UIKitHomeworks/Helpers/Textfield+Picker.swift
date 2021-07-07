//
//  Textfield+Picker.swift
//  UIKitHomeworks
//
//  Created by Vlad on 07.07.2021.
//

import UIKit

final class UITextfieldPicker: UITextField, UIPickerViewAccessibilityDelegate, UIPickerViewDataSource {

    private var items: [String]
    private let picker = UIPickerView()

    init(frame: CGRect, items: [String], placeholder: String) {
        self.items = items
        super.init(frame: frame)
        picker.delegate = self
        picker.dataSource = self
        self.inputView = picker
        self.placeholder = placeholder
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = items[row]
        self.resignFirstResponder()
    }
}
