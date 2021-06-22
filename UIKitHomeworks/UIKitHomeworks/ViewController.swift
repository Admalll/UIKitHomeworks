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
        button.frame = CGRect(x: 150, y: 150, width: 150, height: 150)
        button.setTitle("Сложение", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .red
        button.addTarget(self, action: #selector(additionButtonTap), for: .touchUpInside)
        return button
    }
    
    var guessButton: UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 150, y: 350, width: 150, height: 150)
        button.setTitle("Угадайка", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .red
        button.addTarget(self, action: #selector(guessButtonTap), for: .touchUpInside)
        return button
    }
    
    var fioLabel: UILabel!
    
    var sumLabel: UILabel!
    
    var guessLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupAlert()
    }
    
    func setupView() {
        
        fioLabel = UILabel()
        fioLabel.frame = CGRect(x: 100, y: 50, width: 200, height: 20)
        fioLabel.text = "Welcome, "
        fioLabel.textAlignment = .center
        fioLabel.isHidden = true
        
        sumLabel = UILabel()
        sumLabel.frame = CGRect(x: 100, y: 80, width: 200, height: 20)
        sumLabel.textAlignment = .center
        sumLabel.isHidden = true
        
        
        guessLabel = UILabel()
        guessLabel.frame = CGRect(x: 20, y: 110, width: 380, height: 20)
        guessLabel.textAlignment = .center
        guessLabel.isHidden = true
        
        
        
        self.view.addSubview(additionButton)
        self.view.addSubview(guessButton)
        self.view.addSubview(fioLabel)
        self.view.addSubview(sumLabel)
        self.view.addSubview(guessLabel)
    }
    
    
    func setupAlert() {
        let alert = UIAlertController(title: "Введите ФИО", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Готово", style: .default) { (action) in
            self.fioLabel.text = "Welcome, \(alert.textFields?.first?.text ?? "")!"
            self.fioLabel.isHidden = false
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
    
    @objc func guessButtonTap(_ sender: UIButton) {
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
