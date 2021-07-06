//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

final class TextEditorController: UIViewController {
    
    //MARK: - Visual components
    
    private let mainTextLabel = UILabel()
    private let fontSizeSlider = UISlider()
    private let colorPicker = UIPickerView()
    private let linesNumberPicker = UIPickerView()
    private let textColorLabel = UILabel()
    private let linesNumberLabel = UILabel()
    private let textSizeLabel = UILabel()
    private let shadowEnableSwitch = UISwitch()
    private let shadowEnableLabel = UILabel()
    lazy private var textStyleSegment = UISegmentedControl(items: textStyles)
    
    //MARK: - Private properties
    
    private let textColors = [UIColor.black, UIColor.red, UIColor.green, UIColor.yellow, UIColor.blue, UIColor.orange, UIColor.systemPink, UIColor.gray]
    private let linesNumbers = [0, 1, 2, 3, 4, 5]
    private let textStyles = ["Обычный", "Жирный", "Подчеркнутый"]
    
    //MARK: - UIViewController(ViewController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Private methods
    
    private func setupNavigationBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentTextAlert))
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func setupView() {
        view.backgroundColor = .white
        setupNavigationBar()
        setupFontSizeSlider()
        setupColorPicker()
        setupLinesNumberPicker()
        setupControllerInfo()
        setupMainTextLabel()
        setupTextColorLabel()
        setupLinesNumberLabel()
        setupTextSizeLabel()
        setupShadowEnableSwitch()
        setupShadowEnableLabel()
        setupTextStyleSegment()
    }
    
    private func setupControllerInfo() {
        navigationController?.tabBarItem.title = "Custom text"
        navigationController?.tabBarController?.tabBar.tintColor = .black
        navigationController?.tabBarItem.image = UIImage(systemName: "character.book.closed.fill.hi")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.topItem?.title = "Custom text"
    }
    
    private func setupMainTextLabel() {
        view.addSubview(mainTextLabel)
        mainTextLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        mainTextLabel.center = view.center
        mainTextLabel.text = "Тут будет ваш текст"
        mainTextLabel.adjustsFontSizeToFitWidth = true
        mainTextLabel.lineBreakMode = .byWordWrapping
        mainTextLabel.shadowColor = .lightGray
        mainTextLabel.font = UIFont.boldSystemFont(ofSize: 16)
        mainTextLabel.layer.borderWidth = 1
        mainTextLabel.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setupFontSizeSlider() {
        view.addSubview(fontSizeSlider)
        fontSizeSlider.frame = CGRect(x: 40, y: 775, width: 360, height: 50)
        fontSizeSlider.minimumValue = 10
        fontSizeSlider.maximumValue = 40
        fontSizeSlider.value = 16
        fontSizeSlider.addTarget(self, action: #selector(fontSizeSliderValueChanged(slider:)), for: .valueChanged)
    }
    
    private func setupColorPicker() {
        view.addSubview(colorPicker)
        colorPicker.frame = CGRect(x: 200, y: 66, width: 160, height: 100)
        colorPicker.delegate = self
        colorPicker.dataSource = self
    }
    
    private func setupLinesNumberPicker() {
        view.addSubview(linesNumberPicker)
        linesNumberPicker.frame = CGRect(x: 200, y: 160, width: 160, height: 100)
        linesNumberPicker.delegate = self
        linesNumberPicker.dataSource = self
        linesNumberPicker.selectRow(1, inComponent: 0, animated: false)
    }
    
    private func setupTextColorLabel() {
        view.addSubview(textColorLabel)
        textColorLabel.text = "Цвет текста:"
        textColorLabel.frame = CGRect(x: 40, y: 100, width: 150, height: 30)
        textColorLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    private func setupLinesNumberLabel() {
        view.addSubview(linesNumberLabel)
        linesNumberLabel.text = "Количество строк:"
        linesNumberLabel.frame = CGRect(x: 40, y: 200, width: 160, height: 20)
        linesNumberLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    private func setupTextSizeLabel() {
        view.addSubview(textSizeLabel)
        textSizeLabel.text = "Размер шрифта: 16"
        textSizeLabel.font = UIFont.boldSystemFont(ofSize: 16)
        textSizeLabel.frame = CGRect(x: 40, y: 750, width: 200, height: 20)
    }
    
    private func setupShadowEnableSwitch() {
        view.addSubview(shadowEnableSwitch)
        shadowEnableSwitch.isOn = false
        shadowEnableSwitch.frame = CGRect(x: 175, y: 695, width: 0, height: 0)
        shadowEnableSwitch.addTarget(self, action: #selector(shadowEnableSwitchChangedValue), for: .valueChanged)
    }
    
    private func setupShadowEnableLabel() {
        view.addSubview(shadowEnableLabel)
        shadowEnableLabel.text = "Включить тени"
        shadowEnableLabel.frame = CGRect(x: 40, y: 700, width: 200, height: 20)
        shadowEnableLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    private func setupTextStyleSegment() {
        view.addSubview(textStyleSegment)
        textStyleSegment.selectedSegmentIndex = 1
        textStyleSegment.frame = CGRect(x: 40, y: 300, width: 360, height: 35)
        textStyleSegment.addTarget(self, action: #selector(textStyleSegmentChangedValue), for: .valueChanged)
    }
    
    @objc private func textStyleSegmentChangedValue(segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            mainTextLabel.font = UIFont.systemFont(ofSize: mainTextLabel.font.pointSize)
            mainTextLabel.attributedText = NSMutableAttributedString(string: mainTextLabel.text ?? "", attributes: [.underlineStyle: 0])
        case 1:
            mainTextLabel.font = UIFont.boldSystemFont(ofSize: mainTextLabel.font.pointSize)
            mainTextLabel.attributedText = NSMutableAttributedString(string: mainTextLabel.text ?? "", attributes: [.underlineStyle: 0])
        case 2:
            mainTextLabel.attributedText = NSMutableAttributedString(string: mainTextLabel.text ?? "", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        default:
            break
        }
    }
    
    @objc private func fontSizeSliderValueChanged(slider: UISlider) {
        mainTextLabel.font = UIFont(name: mainTextLabel.font.fontName, size: CGFloat(slider.value))
        textSizeLabel.text = "Размер шрифта: \(Int(slider.value))"
    }
    
    @objc private func shadowEnableSwitchChangedValue() {
        if shadowEnableSwitch.isOn {
            mainTextLabel.shadowOffset = CGSize(width: 2, height: 2)
        } else {
            mainTextLabel.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    @objc private func presentTextAlert() {
        presentAlert(title: "Алерт для ввода текста", message: "Введите текст") { [weak self] text in
            guard let self = self else { return }
            self.mainTextLabel.text = text
        }
    }
}

//MARK: - extension ViewController: UIPickerViewDataSource

extension TextEditorController: UIPickerViewDataSource {

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

extension TextEditorController: UIPickerViewDelegate {
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

