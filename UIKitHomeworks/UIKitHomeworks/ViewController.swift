//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var slider: UISlider!
    
    let pickerItems = ["Кальян", "Смузи", "Крипта!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        slider.setMaximumTrackImage(slider.currentMaximumTrackImage?.withTintColor(.systemOrange, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .systemGray
    }

    func showShareWindow() {
        let items = ["Sharing"]
        let svc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        self.present(svc, animated: true, completion: nil)
    }
    
    @IBAction func shareButtonTap(_ sender: Any) {
        showShareWindow()
    }
    
    @IBAction func sliderChangeValue(_ sender: UISlider) {
        if sender.value == 100 {
            showShareWindow()
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerItems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerItems[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 2 {
            showShareWindow()
        }
    }
    
}
