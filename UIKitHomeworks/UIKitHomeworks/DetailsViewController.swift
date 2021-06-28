//
//  StartViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 28.06.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var selectedItem: String!
    var itemImage = UIImageView()
    var itemPriceLabel = UILabel()
    var countTextfield = UITextField()
    var totalPriceLabel = UILabel()
    var buyButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = selectedItem
        self.navigationController?.navigationBar.barTintColor = .white
        setupView()
    }
    
    func setupView() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(itemImage)
        itemImage.image = UIImage(named: "First" + selectedItem)
        itemImage.frame = CGRect(x: 0, y: 0, width: 450, height: 300)
        itemImage.center = self.view.center
        
        self.view.addSubview(itemPriceLabel)
        itemPriceLabel.text = "Today for: 9999.99 Rubles!"
        itemPriceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        itemPriceLabel.frame = CGRect(x: 40, y: 630, width: 300, height: 30)
        
        self.view.addSubview(countTextfield)
        countTextfield.placeholder = "Items count"
        countTextfield.font = UIFont.boldSystemFont(ofSize: 16)
        countTextfield.frame = CGRect(x: 40, y: 660, width: 200, height: 30)
        countTextfield.addTarget(self, action: #selector(openCountAlert), for: .editingDidBegin)
        
        self.view.addSubview(totalPriceLabel)
        totalPriceLabel.text = "Total price: 9999.99 Rubles"
        totalPriceLabel.font = UIFont.boldSystemFont(ofSize: 23)
        totalPriceLabel.frame = CGRect(x: 40, y: 760, width: 400, height: 30)
        
        self.view.addSubview(buyButton)
        buyButton.setTitle("Buy!", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.backgroundColor = .systemBlue
        buyButton.frame = CGRect(x: 40, y: 800, width: 360, height: 66)
        buyButton.layer.cornerRadius = 10
        buyButton.addTarget(self, action: #selector(presentBusket), for: .touchUpInside)
    }
    
    @objc func presentBusket() {
        let vc = BusketViewController()
        vc.itemName = selectedItem
        vc.itemCount = countTextfield.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func openCountAlert() {
        let alert = UIAlertController(title: "Enter count", message: nil, preferredStyle: .alert)
        alert.addTextField {
            $0.placeholder = "Enter count"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Confrirm", style: .default, handler: { _ in
            guard let text = alert.textFields?.first?.text else { return }
            self.countTextfield.text = text
            self.totalPriceLabel.text = "Total price: \(9999.99 * Double(self.countTextfield.text!)!) Rubles"
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
