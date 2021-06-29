//
//  ViewControllerThree.swift
//  UIKitHomeworks
//
//  Created by Vlad on 29.06.2021.
//

import UIKit

class ViewControllerThree: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showShareWindow() {
        let items = ["Bitcoin: 35 908, 90. UP 6.72%", "Etherium: 5 928, 51. UP 3.22%", "Ripple: 52 345, 00. UP 10%", "Bitcoin CASH: 50 123, 99. UP 52.72%", "EOS: 2 621, 22. UP 11%"]
        let svc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        self.present(svc, animated: true, completion: nil)
    }
    
    @IBAction func oprosButtonTap(_ sender: UIButton) {
        let alert = UIAlertController(title: "Рассказать друзьям?", message: "Поделись с друзьями информацией о курсе валют!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Поделиться", style: .default, handler: { _ in
            self.showShareWindow()
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
