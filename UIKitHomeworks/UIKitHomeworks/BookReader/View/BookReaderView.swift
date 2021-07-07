//
//  BookReaderView.swift
//  UIKitHomeworks
//
//  Created by Vlad on 07.07.2021.
//

import UIKit

final class BookReaderView: UIView {

    //MARK: - Visual components

    private let textView = UITextView()
    private let sizeSlider = UISlider()
    private let blackColorButton = UIButton()
    private let greenColorButton = UIButton()
    private let pinkColorButton = UIButton()
    private let redColorButton = UIButton()
    private let textColorLabel = UILabel()
    private let smallCharacterView = UIImageView()
    private let textThinButton = UIButton()
    private let textFatButton = UIButton()
    private let nightThemeLabel = UILabel()
    private let nightThemeSwitcher = UISwitch()
    private let textFontLabel = UILabel()
    //private let textFontPicker

    //MARK: - Private properties
    private var currentFontWidth = CGFloat(0)

    //MARK: - Initializators

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Private methods

    private func setupView() {
        backgroundColor = .white

        setupTextView()
        setupSizeSlider()
        setupSmallCharacterImage()
        setupBlackColorButton()
        setupGreenColorButton()
        setupPinkColorButton()
        setupRedColorButton()
        setupTextColorLabel()
        setupTextFatButton()
        setupTextThinButton()
        setupNightThemeLabel()
        setupNightThemeSwitcher()
    }

    private func setupTextView() {
        textView.frame = CGRect(x: 20, y: 100, width: 390, height: 500)
        textView.backgroundColor = .white
        textView.text = Consants.defaultText
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.layer.cornerRadius = 5
        textView.font = UIFont.systemFont(ofSize: textView.font?.pointSize ?? 16, weight: UIFont.Weight(currentFontWidth))
        addSubview(textView)
    }

    private func setupSizeSlider() {
        sizeSlider.frame = CGRect(x: 50, y: 625, width: 360, height: 30)
        sizeSlider.minimumValue = 10
        sizeSlider.maximumValue = 40
        sizeSlider.value = 16
        sizeSlider.maximumValueImage = UIImage(systemName: "character")
        sizeSlider.addTarget(self, action: #selector(sizeSliderChangedValue(sender:)), for: .valueChanged)
        addSubview(sizeSlider)
    }

    private func setupSmallCharacterImage() {
        addSubview(smallCharacterView)
        smallCharacterView.image = UIImage(systemName: "character")
        smallCharacterView.frame = CGRect(x: 31, y: 633, width: 10, height: 10)
    }

    private func setupBlackColorButton() {
        blackColorButton.frame = CGRect(x: 180, y: 675, width: 40, height: 40)
        blackColorButton.layer.cornerRadius = 20
        blackColorButton.backgroundColor = .black
        blackColorButton.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
        addSubview(blackColorButton)
    }

    private func setupGreenColorButton() {
        greenColorButton.frame = CGRect(x: 240, y: 675, width: 40, height: 40)
        greenColorButton.layer.cornerRadius = 20
        greenColorButton.backgroundColor = .systemGreen
        greenColorButton.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
        addSubview(greenColorButton)
    }

    private func setupPinkColorButton() {
        pinkColorButton.frame = CGRect(x: 300, y: 675, width: 40, height: 40)
        pinkColorButton.layer.cornerRadius = 20
        pinkColorButton.backgroundColor = .systemPink
        pinkColorButton.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
        addSubview(pinkColorButton)
    }

    private func setupRedColorButton() {
        redColorButton.frame = CGRect(x: 360, y: 675, width: 40, height: 40)
        redColorButton.layer.cornerRadius = 20
        redColorButton.backgroundColor = .systemRed
        redColorButton.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
        addSubview(redColorButton)
    }

    private func setupTextColorLabel() {
        addSubview(textColorLabel)
        textColorLabel.text = "Цвет текста"
        textColorLabel.textAlignment = .center
        textColorLabel.backgroundColor = .link
        textColorLabel.layer.masksToBounds = true
        textColorLabel.layer.cornerRadius = 5
        textColorLabel.font = UIFont.systemFont(ofSize: 16)
        textColorLabel.textColor = .white
        textColorLabel.frame = CGRect(x: 20, y: 680, width: 140, height: 30)
    }

    private func setupTextThinButton() {
        addSubview(textThinButton)
        textThinButton.frame = CGRect(x: 100, y: 730, width: 100, height: 30)
        textThinButton.layer.cornerRadius = 5
        textThinButton.setTitle("a", for: .normal)
        textThinButton.backgroundColor = .link
        textThinButton.setTitleColor(.white, for: .normal)
        textThinButton.addTarget(self, action: #selector(changeTextWidth), for: .touchUpInside)
    }

    private func setupTextFatButton() {
        addSubview(textFatButton)
        textFatButton.frame = CGRect(x: 230, y: 730, width: 100, height: 30)
        textFatButton.layer.cornerRadius = 5
        textFatButton.setTitle("A", for: .normal)
        textFatButton.backgroundColor = .link
        textFatButton.setTitleColor(.white, for: .normal)
        textFatButton.addTarget(self, action: #selector(changeTextWidth), for: .touchUpInside)
    }

    private func setupNightThemeLabel() {
        addSubview(nightThemeLabel)
        nightThemeLabel.text = "Ночной режим"
        nightThemeLabel.backgroundColor = .link
        nightThemeLabel.textColor = .white
        nightThemeLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nightThemeLabel.layer.masksToBounds = true
        nightThemeLabel.layer.cornerRadius = 5
        nightThemeLabel.frame = CGRect(x: 20, y: 780, width: 150, height: 30)
        nightThemeLabel.textAlignment = .center
    }

    private func setupNightThemeSwitcher() {
        addSubview(nightThemeSwitcher)
        nightThemeSwitcher.frame = CGRect(x: 200, y: 780, width: 0, height: 0)
        nightThemeSwitcher.addTarget(self, action: #selector(changeTheme(switcher:)), for: .valueChanged)
    }

    private func setNightTheme() {
        backgroundColor = .black
    }

    private func setLightTheme() {
        backgroundColor = .white
    }

    @objc private func changeTheme(switcher: UISwitch) {
        switcher.isOn ? setNightTheme() : setLightTheme()
    }

    @objc private func changeTextWidth(button: UIButton) {
        switch button {
        case textThinButton:
            currentFontWidth -= 1
            textView.font = UIFont.systemFont(ofSize: textView.font?.pointSize ?? 16, weight: UIFont.Weight(rawValue: currentFontWidth))
        case textFatButton:
            currentFontWidth += 1
            textView.font = UIFont.systemFont(ofSize: textView.font?.pointSize ?? 16, weight: UIFont.Weight(rawValue: currentFontWidth))
        default:
            break
        }
    }

    @objc private func sizeSliderChangedValue(sender: UISlider) {
        textView.font = UIFont(name: textView.font?.fontName ?? "systemFont", size: CGFloat(sender.value))
    }

    @objc private func colorButtonTapped(button: UIButton) {
        switch button {
        case blackColorButton:
            textView.textColor = .black
        case pinkColorButton:
            textView.textColor = .systemPink
        case greenColorButton:
            textView.textColor = .systemGreen
        case redColorButton:
            textView.textColor = .systemRed
        default:
            break
        }
    }
}
