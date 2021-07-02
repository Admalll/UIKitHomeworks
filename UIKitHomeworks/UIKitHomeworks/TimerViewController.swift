//
//  TimerViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 01.07.2021.
//

import UIKit

final class TimerViewController: UIViewController {
    
    //MARK: - IBOulets
    
    @IBOutlet weak var picker: UIPickerView!
    
    //MARK: - Public properties
    
    private var hour: Int = 0
    private var minutes: Int = 0
    private var seconds: Int = 0
    
    //MARK: - UIViewController(TimerViewController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
}

//MARK: - Extesion TimerViewController: UIPickerViewDelegate, UIPickerViewDataSource

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
