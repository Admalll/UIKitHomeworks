//
//  FriendsViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 06.07.2021.
//

import UIKit

final class FriendsViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
