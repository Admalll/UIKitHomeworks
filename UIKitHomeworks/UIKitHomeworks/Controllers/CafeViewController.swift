//
//  CafeViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 23.06.2021.
//

import UIKit

class CafeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func orderButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Выставить чек?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Чек", style: .default, handler: { (action) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "OrderViewController")
            let backItem = UIBarButtonItem()
                backItem.title = "Back"
            self.navigationItem.backBarButtonItem = backItem 
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
