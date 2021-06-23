//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    let authView = AuthView()

    
    override func loadView() {
        self.view = authView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authView.delegate = self
    }
}

extension AuthorizationViewController: AuthViewDelegate {
    func authorizeHandling() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "CafeViewController")
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}
