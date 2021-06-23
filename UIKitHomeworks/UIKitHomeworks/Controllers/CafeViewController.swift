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
    
    // 2.Создать второй экран Cafe где нужно регистрировать гостя поля для ввода фио и через свитчи была ли предоплата , заказывали ли стол (да или нет ) 3 Поля для ввода номера стола 4.Добавить третий экран счёт где выводим фио , номер стола и сумма 5 Добавить кнопку «выставить счёт» расположить на втором экране и по нажатию выкидывать Алерт продолжить да или нет, если нет то убираем Алерт если да то переходим на третий экран
    
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
