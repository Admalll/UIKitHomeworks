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
    
    // 2 По нажатию на “Войти” переходим на второй экран Birthday (Это не таблица) куда будут добавляться дни рождения с третьего экрана. Лэйблы “18 дней” и ”10 марта, в среду…” захардкожены.
    
    func authorize(login: String, password: String) {
        if model.authorize(login: login, password: password) {
            let vc = ContactsViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
