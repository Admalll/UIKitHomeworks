//
//  RegisterViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 06.07.2021.
//

import UIKit

final class RegisterViewController: UIViewController {


    //MARK: - IBOutlets

    @IBOutlet private weak var registerLabel: UILabel!
    @IBOutlet private weak var registerTextField: UITextField!
    @IBOutlet private weak var nicknameTextfield: UITextField!
    @IBOutlet private weak var ageTextfield: UITextField!
    @IBOutlet private weak var nameTextfield: UITextField!
    @IBOutlet private weak var nicknameErrorLabel: UILabel!

    //MARK: - Private properties

    private lazy var textFields = [registerTextField, nicknameTextfield, ageTextfield, nameTextfield]
    private var currentTextFieldResponder: Int?
    private var model = Auth()
    private var isPhone = false

    //MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextfields()
        setupKeyboardNotifications()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        registerTextField.becomeFirstResponder()
    }

    //MARK: - Private methods

    private func setupTextfields() {
        registerTextField.delegate = self
        ageTextfield.delegate = self
        nicknameTextfield.delegate = self
        nameTextfield.delegate = self
    }

    private func setupKeyboardNotifications() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil,
                                               queue: nil) { _ in self.view.frame.origin.y = -150 }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil,
                                               queue: nil) { _ in self.view.frame.origin.y = 91 }
    }

    private func setupNicknameError() {
        nicknameErrorLabel.isHidden = false
    }

    private func setupFriendsViewController() {
        let storyboard = UIStoryboard(name: "Friends", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "FriendsTabBarController")
        navigationController?.pushViewController(vc, animated: true)
        nicknameErrorLabel.isHidden = true
    }

    private func registerNewUser(name: String, age: String, nickname: String, registerText: String) -> Bool {
        if isPhone {
            if model.registerNewUser(user: User(name: name, age: age, nickname: nickname, registrationParameter: .phoneNumber(registerText), id: model.users.count)) {
                return true
            }
        }
        if !isPhone {
            if model.registerNewUser(user: User(name: name, age: age, nickname: nickname, registrationParameter: .emailAddress(registerText), id: model.users.count)) {
                return true
            }
        }
        return false
    }

    //MARK: - IBActions

    @IBAction private func nextButtonTapped(_ sender: UIButton) {
        guard let name = nameTextfield.text, let age = ageTextfield.text, let nickname = nicknameTextfield.text, let registerText = registerTextField.text else { return }
        if registerNewUser(name: name, age: age, nickname: nickname, registerText: registerText) {
            setupFriendsViewController()
        } else {
            setupNicknameError()
        }
    }

    @IBAction private func registerSegmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            registerTextField.placeholder = "Phone Number"
            registerLabel.text = "PHONE NUMBER"
            registerTextField.textContentType = .telephoneNumber
            registerTextField.keyboardType = .phonePad
            isPhone = true
        case 1:
            registerTextField.placeholder = "Email address"
            registerLabel.text = "EMAIL ADDRESS"
            registerTextField.textContentType = .emailAddress
            isPhone = false
        default:
            break
        }
    }
}

//MARK: - UITextFieldDelegate

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let index = currentTextFieldResponder else {
            textField.resignFirstResponder()
            return true
        }
        switch index {
        case 0...2:
            textFields[index + 1]?.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextFieldResponder = textFields.firstIndex(of: textField)
    }
}
