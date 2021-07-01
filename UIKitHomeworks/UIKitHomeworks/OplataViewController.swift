//
//  OplataViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 30.06.2021.
//

import UIKit

class OplataViewController: UIViewController {
    
    // 5. Создать экран оплаты, на котором необходимо спрятать Navigation Bar, а вместо него добавить заголовок оплата, отображаем пиццу и выбранные ингридиенты с предыдущего экрана , добавить выбор способа оплаты (если выбираем наличные отключается свитч оплата картой и наборот)
    
    //MARK: - Public properties
    
    var isCheese = false {
        didSet {
            setupToppings()
        }
    }
    var isVetchina = false {
        didSet {
            setupToppings()
        }
    }
    var isPerec = false {
        didSet {
            setupToppings()
        }
    }
    
    var delegate: OplataDelegate?
    var items = 0
    var price = 0
    var pizzaDescription: String = ""
    var pizzaName: String = ""
    var pizzaImageName: String = ""
    var pizzaPrice = 0
    
    //MARK: - Visual components
    
    let itemsAndPriceLabel = UILabel()
    let pizzaImageView = UIImageView()
    let pizzaPriceLabel = UILabel()
    let pizzaNameLabel = UILabel()
    let pizzaDescriptionLabel = UILabel()
    let cheeseImageView = UIImageView()
    let cheesePriceLabel = UILabel()
    let cheeseNameLabel = UILabel()
    let vetchinaImageView = UIImageView()
    let vetchinaPriceLabel = UILabel()
    let vetchinaNameLabel = UILabel()
    let perecImageView = UIImageView()
    let perecPriceLabel = UILabel()
    let perecNameLabel = UILabel()
    
    let buyButton = UIButton()
    
    //MARK: - UIViewController(OplataViewController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = .systemGray6
        self.title = "Оплата"
        self.navigationItem.hidesBackButton = true
    }
    
    //MARK: - Public methods
    
    func setupView() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(buyButton)
        buyButton.frame = CGRect(x: 40, y: 750, width: 350, height: 50)
        buyButton.layer.cornerRadius = 5
        buyButton.backgroundColor = .black
        buyButton.setImage(UIImage(systemName: "applelogo")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        buyButton.setTitle("Pay", for: .normal)
        buyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        buyButton.titleLabel?.textColor = .white
        buyButton.addTarget(self, action: #selector(buyButtonTap(sender:)), for: .touchUpInside)
        
        self.view.addSubview(itemsAndPriceLabel)
        itemsAndPriceLabel.font = UIFont.boldSystemFont(ofSize: 21)
        itemsAndPriceLabel.frame = CGRect(x: 40, y: 100, width: 300, height: 30)
        
        self.view.addSubview(pizzaImageView)
        pizzaImageView.frame = CGRect(x: 40, y: 150, width: 75, height: 75)
        pizzaImageView.image = UIImage(named: pizzaImageName)
        
        self.view.addSubview(pizzaNameLabel)
        pizzaNameLabel.text = pizzaName
        pizzaNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        pizzaNameLabel.frame = CGRect(x: 130, y: 167, width: 300, height: 20)
        
        self.view.addSubview(pizzaDescriptionLabel)
        pizzaDescriptionLabel.text = pizzaDescription
        pizzaDescriptionLabel.font = UIFont.systemFont(ofSize: 13)
        pizzaDescriptionLabel.textColor = .systemGray3
        pizzaDescriptionLabel.frame = CGRect(x: 130, y: 190, width: 300, height: 20)
        
        self.view.addSubview(pizzaPriceLabel)
        pizzaPriceLabel.text = String(pizzaPrice) + " ₽"
        pizzaPriceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        pizzaPriceLabel.frame = CGRect(x: 50, y: 235, width: 100, height: 30)
        
        self.view.addSubview(cheeseImageView)
        cheeseImageView.frame = CGRect(x: 40, y: 270, width: 75, height: 75)
        cheeseImageView.image = UIImage(named: "cheese")
        
        self.view.addSubview(cheeseNameLabel)
        cheeseNameLabel.text = "Сырный бортик"
        cheeseNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        cheeseNameLabel.frame = CGRect(x: 130, y: 287, width: 300, height: 20)
        
        self.view.addSubview(cheesePriceLabel)
        cheesePriceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        cheesePriceLabel.frame = CGRect(x: 50, y: 355, width: 300, height: 30)
        
        self.view.addSubview(vetchinaImageView)
        vetchinaImageView.frame = CGRect(x: 40, y: 390, width: 75, height: 75)
        vetchinaImageView.image = UIImage(named: "vetchina")
        
        self.view.addSubview(vetchinaNameLabel)
        vetchinaNameLabel.text = "Ветчина"
        vetchinaNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        vetchinaNameLabel.frame = CGRect(x: 130, y: 407, width: 300, height: 20)
        
        self.view.addSubview(vetchinaPriceLabel)
        vetchinaPriceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        vetchinaPriceLabel.frame = CGRect(x: 50, y: 475, width: 300, height: 30)
        
        self.view.addSubview(perecImageView)
        perecImageView.frame = CGRect(x: 40, y: 510, width: 75, height: 75)
        perecImageView.image = UIImage(named: "perec")
        
        self.view.addSubview(perecNameLabel)
        perecNameLabel.text = "Перец"
        perecNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        perecNameLabel.frame = CGRect(x: 130, y: 527, width: 300, height: 20)
        
        self.view.addSubview(perecPriceLabel)
        perecPriceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        perecPriceLabel.frame = CGRect(x: 50, y: 595, width: 300, height: 30)
        setupToppings()
        setupItemsAndPrice()
    }
    
    func setupItemsAndPrice() {
        itemsAndPriceLabel.text = "\(items) Товара за \(price) ₽"
    }
    
    func setupToppings() {
        if isCheese {
            cheesePriceLabel.text = "169 ₽"
        }
        else {
            cheesePriceLabel.text = "Без добавления сырного бортика"
        }
        
        if isVetchina {
            vetchinaPriceLabel.text = "189 ₽"
        }
        else {
            vetchinaPriceLabel.text = "Без добавления ветчины"
        }
        if isPerec {
            perecPriceLabel.text = "109 ₽"
        }
        else {
            perecPriceLabel.text = "Без добавления перца"
        }
    }
    
    // 6. При нажатии на кнопку оплаты показываем алерт об успешной оплате заказа, при нажатии на кнопку ОК мы переходим на экран выбора еды (второй после экрана авторизации)
    
    @objc func buyButtonTap(sender: UIButton) {
        let alert = UIAlertController(title: "Заказ оплачен", message: "Ваш заказ доставят в течение 15 минут! Приятного аппетита", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            self.navigationController?.dismiss(animated: false, completion: nil)
            self.delegate?.returnFromOplata()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

protocol OplataDelegate {
    func returnFromOplata()
}
