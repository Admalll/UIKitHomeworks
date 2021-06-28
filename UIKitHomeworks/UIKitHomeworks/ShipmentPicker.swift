//
//  UIPickerTextField.swift
//  UIKitHomeworks
//
//  Created by Vlad on 24.06.2021.
//

import UIKit

class UIShipmentPicker: UITextField, UIPickerViewAccessibilityDelegate, UIPickerViewDataSource {
    
    let shipments = ["Доставка", "Самовывоз", "Звонок менеджера"]
    let shipmentsPicker = UIPickerView()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return shipments.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return shipments[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = shipments[row]
        self.resignFirstResponder()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        shipmentsPicker.delegate = self
        shipmentsPicker.dataSource = self
        self.inputView = shipmentsPicker
        self.placeholder = "Choose shipment"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
