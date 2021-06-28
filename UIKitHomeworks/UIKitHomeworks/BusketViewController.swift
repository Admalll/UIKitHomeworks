//
//  BusketViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 28.06.2021.
//

import UIKit

class BusketViewController: UIViewController {
    
    var itemName: String!
    var itemCount: String!
    let itemLabel = UILabel()
    let itemImage = UIImageView()
    let totalPrice = UILabel()
    let shipmentTextfield = UIShipmentPicker()
    let chooseShipmentLabel = UILabel()
    let totalPriceLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.navigationItem.title = "Busket"
    }
    

    func setupView() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(itemLabel)
        itemLabel.text = "Shipment \(itemCount!) \(itemName!)"
        itemLabel.frame = CGRect(x: 100, y: 100, width: 300, height: 30)
        itemLabel.font = UIFont.boldSystemFont(ofSize: 21)
        
        self.view.addSubview(itemImage)
        itemImage.image = UIImage(named: itemName)
        itemImage.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        itemImage.center = view.center
        
        self.view.addSubview(shipmentTextfield)
        shipmentTextfield.frame = CGRect(x: 80, y: 650, width: 300, height: 30)
        shipmentTextfield.font = UIFont.boldSystemFont(ofSize: 21)
        
        self.view.addSubview(totalPriceLabel)
        totalPriceLabel.text = "Total price in Rubles"
        totalPriceLabel.frame = CGRect(x: 80, y: 700, width: 300, height: 30)
        totalPriceLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        self.view.addSubview(totalPrice)
        totalPrice.text = "\(Double(itemCount!)! * 99999)"
        totalPrice.frame = CGRect(x: 80, y: 750, width: 300, height: 30)
        totalPrice.font = UIFont.boldSystemFont(ofSize: 21)
        
        self.view.addSubview(chooseShipmentLabel)
        chooseShipmentLabel.text = "Shipment type"
        chooseShipmentLabel.frame = CGRect(x: 80, y: 600, width: 300, height: 30)
        chooseShipmentLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
    }

}
