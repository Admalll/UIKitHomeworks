//
//  ContactsViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 24.06.2021.
//

import UIKit

class ContactsViewController: UIViewController {
    
    let contactsView = ContactsView()
    
    override func loadView() {
        self.view = contactsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Birthday"
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.backgroundColor = .gray
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContact))
    }
    
    // 3 По нажатию на кнопку + попадаем на третий экран. Дата, возраст, пол - пикеры. Instagram - алертКонтроллер.
    
    @objc func addContact() {
        
        let vc = AddContactViewController()
        self.navigationController?.present(vc, animated: true, completion: nil)
        
    }
}
