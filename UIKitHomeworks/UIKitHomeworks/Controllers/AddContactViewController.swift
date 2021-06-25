//
//  AddContactViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 24.06.2021.
//

import UIKit

class AddContactViewController: UIViewController {
    
    let contactView = AddContactView()
    
    override func loadView() {
        self.view = contactView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contactView.delegate = self
    }

}

extension AddContactViewController: AddContactViewDelegate {
    func closeModal() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func openInstagramAlert() {
        let alert = UIAlertController(title: "Введите username Instagram", message: nil, preferredStyle: .alert)
        alert.addTextField {
            $0.placeholder = "например yashalava2019"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            self.contactView.instagramTextfield.text = alert.textFields?.first?.text
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
