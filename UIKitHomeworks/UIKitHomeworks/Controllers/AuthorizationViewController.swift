//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    let authView = AuthView()
    let model = AuthModel()
    
    
    override func loadView() {
        self.view = authView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authView.delegate = self
    }
}

extension AuthorizationViewController: AuthViewDelegate {
    func authorizeHandling(login: String, password: String) {
        
        if model.authUser(login: login, password: password) {
            
            authView.authorizeSuccess()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondVC = storyboard.instantiateViewController(identifier: "CafeViewController")
            self.navigationController?.pushViewController(secondVC, animated: true)
        } else {
            authView.authorizeError()
        }
    }
}
