//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

class OnboardViewController: UIViewController {

    //MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.shadowImage = UIImage()
    }


}

