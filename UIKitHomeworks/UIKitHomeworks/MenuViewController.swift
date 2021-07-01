//
//  MenuViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 30.06.2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    //2. Создать второй экран, где будет выбор блюда, при выборе пицца переходим на следующий экран, добавить вверх экрана заголовок Food и не должно быть кнопки назад (на navigation баре) (при выборе суши никуда не переходим)
    
    //MARK: - Public properties
    
    var delegate: OplataDelegate?
    
    //MARK: - Visual components
    
    let countryLabel = UILabel()
    let shipmentUIView = UIView()
    let shipmentSegment = UISegmentedControl(items: ["На доставку", "В зале"])
    let setShipmentAddressButton = UIButton()
    let advertismentImage = UIImageView()
    let pizzaImage = UIImageView()
    let sushiImage = UIImageView()
    
    //MARK: - UIViewController(MenuViewController)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = .systemGray6
        self.title = "Food"
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    //MARK: - Public methods
    
    func setupView() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(countryLabel)
        countryLabel.text = "Россия 🇷🇺"
        countryLabel.frame = CGRect(x: 16, y: 100, width: 150, height: 20)
        countryLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        self.view.addSubview(shipmentUIView)
        shipmentUIView.frame = CGRect(x: 16, y: 130, width: 394, height: 100)
        shipmentUIView.layer.cornerRadius = 10
        shipmentUIView.backgroundColor = .systemGray6
        shipmentUIView.addSubview(shipmentSegment)
        shipmentSegment.frame = CGRect(x: 16, y: 20, width: 362, height: 30)
        shipmentSegment.selectedSegmentIndex = 0
        shipmentUIView.addSubview(setShipmentAddressButton)
        setShipmentAddressButton.frame = CGRect(x: 50, y: 60, width: 300, height: 30)
        setShipmentAddressButton.setTitle("Указать адрес доставки >", for: .normal)
        setShipmentAddressButton.setTitleColor(.systemOrange, for: .normal)
        
        self.view.addSubview(advertismentImage)
        advertismentImage.layer.cornerRadius = 10
        advertismentImage.frame = CGRect(x: 16, y: 250, width: 394, height: 100)
        advertismentImage.backgroundColor = .systemOrange
        let advertiseLabel = UILabel()
        advertiseLabel.text = "Реклама"
        advertiseLabel.font = UIFont.boldSystemFont(ofSize: 21)
        advertiseLabel.textColor = .black
        advertismentImage.addSubview(advertiseLabel)
        advertiseLabel.frame = CGRect(x: 150, y: 25, width: 100, height: 50)
        
        self.view.addSubview(pizzaImage)
        pizzaImage.layer.cornerRadius = 10
        pizzaImage.frame = CGRect(x: 16, y: 375, width: 394, height: 100)
        pizzaImage.backgroundColor = .systemOrange
        let pizzaLabel = UILabel()
        pizzaLabel.text = "Пицца"
        pizzaLabel.font = UIFont.boldSystemFont(ofSize: 21)
        pizzaLabel.textColor = .black
        pizzaImage.addSubview(pizzaLabel)
        pizzaLabel.frame = CGRect(x: 160, y: 25, width: 100, height: 50)
        pizzaImage.isUserInteractionEnabled = true
        let pizzaGesture = UITapGestureRecognizer(target: self, action: #selector(pizzaTap))
        pizzaImage.addGestureRecognizer(pizzaGesture)
        
        self.view.addSubview(sushiImage)
        sushiImage.layer.cornerRadius = 10
        sushiImage.frame = CGRect(x: 16, y: 500, width: 394, height: 100)
        sushiImage.backgroundColor = .systemOrange
        let sushiLabel = UILabel()
        sushiLabel.text = "Суши"
        sushiLabel.font = UIFont.boldSystemFont(ofSize: 21)
        sushiLabel.textColor = .black
        sushiImage.addSubview(sushiLabel)
        sushiLabel.frame = CGRect(x: 165, y: 25, width: 100, height: 50)
    }
    
    @objc func pizzaTap() {
        let vc = PizzaViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - OplataDelegate

extension MenuViewController: OplataDelegate {
    func returnFromOplata() {
        self.navigationController?.popViewController(animated: false)
    }
}
