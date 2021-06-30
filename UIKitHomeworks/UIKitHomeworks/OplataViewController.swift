//
//  OplataViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 30.06.2021.
//

import UIKit

class OplataViewController: UIViewController {
    
    //MARK: - UIViewController(OplataViewController)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = .systemGray6
        self.title = "Оплата"
        self.navigationItem.hidesBackButton = true
    }
    
    //MARK: - Public methods
    
    func setupView() {
        self.view.backgroundColor = .white
    }
}
