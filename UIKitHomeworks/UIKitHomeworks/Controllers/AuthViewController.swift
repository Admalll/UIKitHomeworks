//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    let authView = AuthView()
    let model = AuthModel()
    
    override func loadView() {
        self.view = authView
        authView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AuthViewController: AuthViewDelegate {
    
    func authorize(login: String, password: String) {
        if model.authorize(login: login, password: password) {
            
        }
    }
    
    
}
