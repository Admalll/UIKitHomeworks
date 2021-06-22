//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var model = MessageModel()
    var messageView = MessageView()

    override func loadView() {
        super.loadView()
        self.view = messageView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupAlert()
    }
    
    func setupAlert() {
        let alert = UIAlertController(title: "Enter message", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self] (action) in
            guard let self = self else { return }
            guard let text = alert.textFields?.first?.text else { return }
            self.messageView.messageLabel.text = self.model.returnMessage(message: text)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

