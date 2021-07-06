//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

final class OnboardViewController: UIViewController {

    //MARK: - Private properties
    private let defaults = UserDefaults.standard
    private var isLogged: Bool {
        get {
            return defaults.bool(forKey: "LOGGED_IN_KEY")
        } set {
            defaults.setValue(newValue, forKey: "LOGGED_IN_KEY")
        }
    }

    //MARK: - UIViewController

    override func loadView() {
        checkIsLoged()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    //MARK: - Private methods

    private func checkIsLoged() {
        if isLogged {
            let sb = UIStoryboard(name: "Friends", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "FriendsTabBarController")
            navigationController?.pushViewController(vc, animated: true)
        } else {
            isLogged = true
        }
    }
}

