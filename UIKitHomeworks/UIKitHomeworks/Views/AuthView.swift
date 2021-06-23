//
//  AuthView.swift
//  UIKitHomeworks
//
//  Created by Vlad on 23.06.2021.
//

import UIKit

class AuthView: UIView {
    
    weak var delegate: AuthViewDelegate?
    
    let eyeButton = UIButton()
    let appleImage = UIImageView()
    let appleLabel = UILabel()
    let signinLabel = UILabel()
    let emailLabel = UILabel()
    let passwordLabel = UILabel()
    let emailTextfield = UITextField()
    let passwordTextfield = UITextField()
    let authorizeButton = UIButton()
    
    
    //1 Создать экран регистрации где нужно ввести логин и пароль 2 поля и кнопка вход которая ведёт на второй экран
    private func setupView() {
        
        self.backgroundColor = .white
        
        self.addSubview(appleImage)
        appleImage.image = UIImage(imageLiteralResourceName: "cloud")
        appleImage.frame = CGRect(x: 175, y: 100, width: 100, height: 100)
        
        self.addSubview(appleLabel)
        appleLabel.text = "Company Apple"
        appleLabel.textColor = .gray
        appleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        appleLabel.frame = CGRect(x: 160, y: 190, width: 200, height: 30)
        
        self.addSubview(signinLabel)
        signinLabel.frame = CGRect(x: 40, y: 240, width: 100, height: 30)
        signinLabel.text = "Sign in"
        signinLabel.font = UIFont.boldSystemFont(ofSize: 28.0)
        
        self.addSubview(emailLabel)
        emailLabel.frame = CGRect(x: 40, y: 290, width: 100, height: 20)
        emailLabel.font = UIFont.boldSystemFont(ofSize: 16)
        emailLabel.text = "Email"
        emailLabel.textColor = .red
        
        self.addSubview(emailTextfield)
        emailTextfield.frame = CGRect(x: 40, y: 320, width: 400, height: 30)
        emailTextfield.placeholder = "Enter your e-mail"
        emailTextfield.font = UIFont.boldSystemFont(ofSize: 16)
        
        let bottomLineEmail = CALayer()
        bottomLineEmail.frame = CGRect(x: 0, y: 30, width: 350, height: 1)
        bottomLineEmail.backgroundColor = UIColor.lightGray.cgColor
        emailTextfield.borderStyle = UITextField.BorderStyle.none
        emailTextfield.layer.addSublayer(bottomLineEmail)
        
        self.addSubview(passwordLabel)
        passwordLabel.frame = CGRect(x: 40, y: 400, width: 100, height: 20)
        passwordLabel.text = "Password"
        passwordLabel.textColor = .red
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        self.addSubview(passwordTextfield)
        passwordTextfield.frame = CGRect(x: 40, y: 430, width: 400, height: 30)
        passwordTextfield.placeholder = "Enter your password"
        passwordTextfield.isSecureTextEntry = true
        let bottomLinePassword = CALayer()
        bottomLinePassword.frame = CGRect(x: 0, y: 30, width: 350, height: 1)
        bottomLinePassword.backgroundColor = UIColor.lightGray.cgColor
        passwordTextfield.borderStyle = UITextField.BorderStyle.none
        passwordTextfield.layer.addSublayer(bottomLinePassword)
        
        self.addSubview(authorizeButton)
        authorizeButton.frame = CGRect(x: 40, y: 560, width: 350, height: 60)
        authorizeButton.backgroundColor = .red
        authorizeButton.setTitle("Войти", for: .normal)
        authorizeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        authorizeButton.tintColor = .white
        authorizeButton.layer.cornerRadius = 5
        authorizeButton.addTarget(self, action: #selector(authorizeButtonTap), for: .touchUpInside)
        
        self.addSubview(eyeButton)
        eyeButton.frame = CGRect(x: 360, y: 430, width: 25, height: 30)
        eyeButton.setImage(UIImage(imageLiteralResourceName: "eye"), for: .normal)
        eyeButton.addTarget(self, action: #selector(tooglePassword), for: .touchUpInside)
        
    }
    
    @objc private func tooglePassword() {
        passwordTextfield.isSecureTextEntry.toggle()
    }
    
    @objc private func authorizeButtonTap() {
        delegate?.authorizeHandling()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


protocol AuthViewDelegate: AnyObject {

    func authorizeHandling()
}
