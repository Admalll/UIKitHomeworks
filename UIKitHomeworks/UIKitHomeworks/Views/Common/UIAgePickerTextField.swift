//
//  UIAgePickerTextField.swift
//  UIKitHomeworks
//
//  Created by Vlad on 24.06.2021.
//

import UIKit

class UIAgePickerTextField: UITextField, UIPickerViewAccessibilityDelegate, UIPickerViewDataSource {
    
    var ages: [Int] {
        var result = [0]
        for i in 1...100 {
            result += [i]
        }
        return result
    }
    let sexPickerView = UIPickerView()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(ages[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = String(ages[row])
        self.resignFirstResponder()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sexPickerView.delegate = self
        sexPickerView.dataSource = self
        self.inputView = sexPickerView
        self.placeholder = "Выберите пол"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
