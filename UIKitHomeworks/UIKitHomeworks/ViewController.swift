//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

class ViewController: UIViewController {

    var additionButton: UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 100, width: 150, height: 150)
        button.setTitle("Сложение", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .red
        button.addTarget(self, action: #selector(additionButtonTap), for: .touchUpInside)
        return button
    }
    
    var guessButton: UIButton {
        let button = UIButton()
        button.backgroundColor = .black
        button.tintColor = .red
        return button
    }
    
    var fioLabel: UILabel {
        let label = UILabel()
        label.text = "Welcome, "
        label.textAlignment = .center
        return label
    }
    
    var sumLabel: UILabel {
        let label = UILabel()
        label.isHidden = true
        return label
    }
    
    var guessLabel: UILabel {
        let label = UILabel()
        label.isHidden = true
        return label
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(additionButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupAlert()
    }
    
    
    func setupAlert() {
        let alert = UIAlertController(title: "Введите ФИО", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Готово", style: .default) { (action) in
            self.fioLabel.text = "Welcome, \(alert.textFields?.first?.text ?? "")!"
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func additionButtonTap(_ sender: UIButton) {
        let alert = UIAlertController(title: "Сложение", message: "Введите числа", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Сложить", style: .default, handler: { (action) in
            guard let number1 = Int(alert.textFields?.first?.text ?? ""), let number2 = Int(alert.textFields?.last?.text ?? "") else { return }
            self.sumLabel.isHidden = false
            self.sumLabel.text = "Result: \(number1 + number2)"
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func guessButtonTup(_ sender: UIButton) {
        let alert = UIAlertController(title: "Угадай число", message: "Введите число от 1 до 10", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Угадать", style: .default, handler: { (action) in
            guard let number = Int(alert.textFields?.first?.text ?? "") else { return }
            let randomNumber = Int.random(in: 1...10)
            self.guessLabel.isHidden = false
            if number == randomNumber {
                self.guessLabel.text = "Вы угадали!"
            } else {
                self.guessLabel.text = "Вы не угадали. Попробуйте снова."
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
