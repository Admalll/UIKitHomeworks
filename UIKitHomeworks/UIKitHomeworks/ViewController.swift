//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - Visual components
    
    private let mainTextLabel = UILabel()
    private let fontSizeSlider = UISlider()
    private let colorPicker = UIPickerView()
    private let linesNumberPicker = UIPickerView()
    
    //MARK: - Private properties
    
    private let textColors = [UIColor.black, UIColor.red, UIColor.green, UIColor.yellow, UIColor.blue, UIColor.orange, UIColor.systemPink, UIColor.gray]
    private let linesNumbers = [0, 1, 2, 3, 4, 5]
    
    //MARK: - UIViewController(ViewController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
        setupFontSizeSlider()
        setupColorPicker()
        setupLinesNumberPicker()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupControllerInfo()
        setupMainTextLabel()
    }
    
    //MARK: - Private methods
    
    private func setupNavigationBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentTextAlert))
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupControllerInfo() {
        tabBarItem.title = "Statistic"
        tabBarController?.tabBar.tintColor = .black
        tabBarItem.image = UIImage(systemName: "character.book.closed.fill.hi")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.topItem?.title = "Statistic"
    }
    
    private func setupMainTextLabel() {
        view.addSubview(mainTextLabel)
        mainTextLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        mainTextLabel.center = view.center
        mainTextLabel.text = "Тут будет ваш текст"
        mainTextLabel.adjustsFontSizeToFitWidth = true
        mainTextLabel.lineBreakMode = .byWordWrapping
        mainTextLabel.shadowColor = .lightGray
        mainTextLabel.shadowOffset = CGSize(width: 1.5, height: 1.5)
    }
    
    private func setupFontSizeSlider() {
        view.addSubview(fontSizeSlider)
        fontSizeSlider.frame = CGRect(x: 40, y: 600, width: 360, height: 50)
        fontSizeSlider.minimumValue = 10
        fontSizeSlider.maximumValue = 40
        fontSizeSlider.value = 16
        fontSizeSlider.addTarget(self, action: #selector(fontSizeSliderValueChanged(slider:)), for: .valueChanged)
    }
    
    private func setupColorPicker() {
        view.addSubview(colorPicker)
        colorPicker.frame = CGRect(x: 40, y: 150, width: 360, height: 100)
        colorPicker.delegate = self
        colorPicker.dataSource = self
    }
    
    private func setupLinesNumberPicker() {
        view.addSubview(linesNumberPicker)
        linesNumberPicker.frame = CGRect(x: 40, y: 300, width: 360, height: 100)
        linesNumberPicker.delegate = self
        linesNumberPicker.dataSource = self
        linesNumberPicker.selectRow(1, inComponent: 0, animated: false)
    }
    
    @objc private func fontSizeSliderValueChanged(slider: UISlider) {
        mainTextLabel.font = UIFont(name: mainTextLabel.font.fontName, size: CGFloat(slider.value))
    }
    
    @objc private func presentTextAlert() {
        let alert = UIAlertController(title: "Алерт для ввода текста", message: "Введите текст", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak self] _ in
            guard let self = self, let text = alert.textFields?.first?.text else { return }
            self.mainTextLabel.text = text
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
}

//MARK: - extension ViewController: UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case colorPicker:
            return textColors.count
        case linesNumberPicker:
            return linesNumbers.count
        default:
            return 0
        }
    }
}

//MARK: - extension ViewController: UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case colorPicker:
            return textColors[row].accessibilityName.localizedCapitalized
        case linesNumberPicker:
            return String(linesNumbers[row])
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case colorPicker:
            mainTextLabel.textColor = textColors[row]
        case linesNumberPicker:
            mainTextLabel.numberOfLines = linesNumbers[row]
        default:
            break
        }
    }
}
