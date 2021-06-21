//
//  SecondViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
    }
    
    override func loadView() {
        super.loadView()
        print("load view")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
}
