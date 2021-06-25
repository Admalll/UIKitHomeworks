//
//  AuthView.swift
//  UIKitHomeworks
//
//  Created by Vlad on 24.06.2021.
//

import UIKit

class AuthView: UIView {
    
    // 1 Создать экран регистрации где нужно ввести логин и пароль 2 поля и кнопка вход которая ведёт на второй экран.
    
    weak var delegate: AuthViewDelegate?
    let logoLabel = UILabel()
    let signinLabel = UILabel()
    let emailLabel = UILabel()
    let emailTextfield = UITextField()
    let passwordLabel = UILabel()
    let passwordTextfield = UITextField()
    let faceidLabel = UILabel()
    let faceidSwitch = UISwitch()
    let loginButton = UIButton()
    let eyeButton = UIButton()
    
    private func setupAuthView() {
        
        self.backgroundColor = .white
        
        self.addSubview(logoLabel)
        logoLabel.text = "Birthday Reminder"
        logoLabel.font = UIFont.boldSystemFont(ofSize: 16)
        logoLabel.textColor = .systemBlue
        logoLabel.textAlignment = .center
        logoLabel.layer.borderWidth = 1
        logoLabel.layer.borderColor = UIColor.black.cgColor
        logoLabel.frame = CGRect(x: 115, y: 100, width: 200, height: 100)
        
        self.addSubview(signinLabel)
        signinLabel.text = "Sign in"
        signinLabel.font = UIFont.boldSystemFont(ofSize: 35)
        signinLabel.frame = CGRect(x: 40, y: 250, width: 200, height: 50)
        
        self.addSubview(emailLabel)
        emailLabel.text = "Email"
        emailLabel.textColor = .systemBlue
        emailLabel.font = UIFont.boldSystemFont(ofSize: 16)
        emailLabel.frame = CGRect(x: 40, y: 300, width: 200, height: 30)
        
        self.addSubview(emailTextfield)
        emailTextfield.placeholder = "Введите e-mail"
        emailTextfield.font = UIFont.boldSystemFont(ofSize: 16)
        emailTextfield.textContentType = .emailAddress
        emailTextfield.frame = CGRect(x: 40, y: 330, width: 350, height: 30)
        let emailLayer = CALayer()
        emailLayer.frame = CGRect(x: 0, y: emailTextfield.frame.height - 1, width: emailTextfield.frame.width, height: 1)
        emailLayer.backgroundColor = UIColor.gray.cgColor
        emailTextfield.borderStyle = UITextField.BorderStyle.none
        emailTextfield.layer.addSublayer(emailLayer)
        
        self.addSubview(passwordLabel)
        passwordLabel.text = "Password"
        passwordLabel.textColor = .systemBlue
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 16)
        passwordLabel.frame = CGRect(x: 40, y: 400, width: 350, height: 30)
        
        self.addSubview(passwordTextfield)
        passwordTextfield.placeholder = "Введите пароль"
        passwordTextfield.font = UIFont.boldSystemFont(ofSize: 16)
        passwordTextfield.isSecureTextEntry = true
        passwordTextfield.frame = CGRect(x: 40, y: 430, width: 350, height: 30)
        let passwordLayer = CALayer()
        passwordLayer.frame = CGRect(x: 0.0, y: passwordTextfield.frame.height - 1, width: passwordTextfield.frame.width, height: 1.0)
        passwordLayer.backgroundColor = UIColor.gray.cgColor
        passwordTextfield.borderStyle = .none
        passwordTextfield.layer.addSublayer(passwordLayer)
        
        self.addSubview(eyeButton)
        eyeButton.frame = CGRect(x: 360, y: 425, width: 30, height: 30)
        let image = UIImage(systemName: "eye.fill")
        let colorImage = image?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        eyeButton.setImage(colorImage, for: .normal)
        eyeButton.addTarget(self, action: #selector(securePassword), for: .touchUpInside)
        
        self.addSubview(faceidLabel)
        faceidLabel.frame = CGRect(x: 170, y: 500, width: 250, height: 30)
        faceidLabel.text = "Вход по Face ID"
        faceidLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        self.addSubview(faceidSwitch)
        faceidSwitch.frame = CGRect(x: 320, y: 500, width: 50, height: 30)
        faceidSwitch.setOn(true, animated: false)
        
        self.addSubview(loginButton)
        loginButton.frame = CGRect(x: 40, y: 580, width: 350, height: 50)
        loginButton.layer.cornerRadius = 5
        loginButton.setTitle("Войти", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        loginButton.layer.shadowRadius = 5
        loginButton.layer.shadowOpacity = 1
        loginButton.addTarget(self, action: #selector(authorize), for: .touchUpInside)
    }
    
    // 4 Опционально для тех, кто не почуствовал задания и для тех кто хочет расти как крутой программист: * При нажатии на кнопку с глазом на первом экране должен показываться пароль из второго поля вместо точек.
    
    @objc func securePassword() {
        passwordTextfield.isSecureTextEntry.toggle()
    }
    
    @objc func authorize() {
        guard let login = emailTextfield.text, let password = passwordTextfield.text else { return }
        delegate?.authorize(login: login, password: password)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAuthView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

protocol AuthViewDelegate: AnyObject {
    func authorize(login: String, password: String)
}
