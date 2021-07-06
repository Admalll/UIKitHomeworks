//
//  UIViewController+alerts.swift
//  UIKitHomeworks
//
//  Created by Vlad on 06.07.2021.
//

import UIKit

extension UIViewController {
    
    func presentAlert(title: String, message: String, complition: @escaping (String) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { _ in
            guard let text = alert.textFields?.first?.text else { return }
            complition(text)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
}
