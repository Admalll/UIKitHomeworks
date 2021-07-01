//
//  TimerViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 01.07.2021.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var picker: UIPickerView!
    
    var hour: Int = 0
    var minutes: Int = 0
    var seconds: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
}

extension TimerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 25
        case 1,2:
            return 60

        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/3
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) ч"
        case 1:
            return "\(row) мин"
        case 2:
            return "\(row) с"
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hour = row
        case 1:
            minutes = row
        case 2:
            seconds = row
        default:
            break
        }
    }
}
