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
        messageView.messageButton.addTarget(self, action: #selector(tapStartButton), for: .touchUpInside)
    }
    
    func message(message: String) -> String {
        return model.returnMessage(message: message)
    }
    
    // 5 Создать второе приложение MVC у которого на экране будет кнопка "начать" которая вызывает Алерт с сообщением "введите слово"
    
    private func setupAlert() {
        let alert = UIAlertController(title: "Enter message", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self] (action) in
            guard let self = self else { return }
            guard let text = alert.textFields?.first?.text else { return }
            self.messageView.messageLabel.text = self.message(message: text)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func tapStartButton() {
        setupAlert()
    }
}

