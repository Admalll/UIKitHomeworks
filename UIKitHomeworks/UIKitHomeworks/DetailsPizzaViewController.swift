//
//  DetailsPizzaViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 30.06.2021.
//

import UIKit

class DetailsPizzaViewController: UIViewController {
    
    //MARK: - Visual components
    
    let pizzaImageView = UIImageView()
    let pizzaNameLabel = UILabel()
    let pizzaDescriptionLabel = UILabel()
    let pizzaParametersLabel = UILabel()
    let sizeSegment = UISegmentedControl(items: ["Маленькая", "Средняя", "Большая"])
    let testoSegment = UISegmentedControl(items: ["Традиционное", "Тонкое"])
    let toppingsLabel = UILabel()
    let toppingsUIView = UIView()
    let cheeseView = UIView()
    let cheeseImage = UIImageView()
    let cheeseLabel = UILabel()
    let cheesePriceLabel = UILabel()
    let perecView = UIView()
    let perecPriceLabel = UILabel()
    let perecImage = UIImageView()
    let perecLabel = UILabel()
    let vetchinaView = UIView()
    let vetchinaPriceLabel = UILabel()
    let vetchinaImage = UIImageView()
    let vetchinaLabel = UILabel()
    let busketButton = UIButton()
    
    //MARK: - Public properties
    
    var delegate: OplataDelegate?
    var pizzaName: String?
    var pizzaImageName: String?
    var pizzaDescription: String?
    var items = 1
    var pizzaPrice = 449
    var currentPrice: Int = 449 {
        didSet {
            busketButton.setTitle("В корзину за \(currentPrice) ₽", for: .normal)
        }
    }
    var testoType: String = "традиционное" {
        didSet {
            sizeChanged()
        }
    }
    var cheeseTopping = false
    var perecTopping = false
    var vetchinaTopping = false
    lazy var pizzaParameters: String = "Средняя 30 см, \(testoType) тесто, 610 г" {
        didSet {
            pizzaParametersLabel.text = pizzaParameters
        }
    }
    
    //MARK: - Initializers
    
    convenience init(name: String, image: String, description: String, frame: CGRect) {
        self.init()
        self.pizzaName = name
        self.pizzaImageName = image
        self.pizzaDescription = description
    }
    
    //MARK: - UIViewController(DetailsPizzaViewController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    //MARK: - Public methods
    
    func setupView() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(pizzaImageView)
        pizzaImageView.frame = CGRect(x: 50, y: 50, width: 350, height: 350)
        pizzaImageView.image = UIImage(named: pizzaImageName  ?? "")
        
        self.view.addSubview(pizzaNameLabel)
        pizzaNameLabel.text = pizzaName ?? ""
        pizzaNameLabel.font = UIFont.boldSystemFont(ofSize: 27)
        pizzaNameLabel.frame = CGRect(x: 20, y: 405, width: 300, height: 30)
        
        self.view.addSubview(pizzaDescriptionLabel)
        pizzaDescriptionLabel.text = pizzaDescription ?? ""
        pizzaDescriptionLabel.font = UIFont.systemFont(ofSize: 13)
        pizzaDescriptionLabel.numberOfLines = 2
        pizzaDescriptionLabel.frame = CGRect(x: 20, y: 450, width: 400, height: 40)
        
        self.view.addSubview(pizzaParametersLabel)
        pizzaParametersLabel.text = pizzaParameters
        pizzaParametersLabel.textColor = .gray
        pizzaParametersLabel.frame = CGRect(x: 20, y: 435, width: 400, height: 15)
        pizzaParametersLabel.font = UIFont.systemFont(ofSize: 13)
        
        self.view.addSubview(sizeSegment)
        sizeSegment.frame = CGRect(x: 20, y: 510, width: 390, height: 40)
        sizeSegment.selectedSegmentIndex = 1
        sizeSegment.addTarget(self, action: #selector(sizeChanged), for: .valueChanged)
        
        self.view.addSubview(testoSegment)
        testoSegment.frame = CGRect(x: 20, y: 560, width: 390, height: 40)
        testoSegment.selectedSegmentIndex = 0
        testoSegment.addTarget(self, action: #selector(testoChangedValue), for: .valueChanged)
        
        self.view.addSubview(toppingsLabel)
        toppingsLabel.text = "Добавить в пиццу"
        toppingsLabel.font = UIFont.boldSystemFont(ofSize: 16)
        toppingsLabel.frame = CGRect(x: 20, y: 610, width: 150, height: 20)
        
        self.view.addSubview(toppingsUIView)
        toppingsUIView.frame = CGRect(x: 20, y: 640, width: 390, height: 150)
        
        toppingsUIView.addSubview(cheeseView)
        cheeseView.frame = CGRect(x: 0, y: 0, width: 125, height: 150)
        cheeseView.addSubview(cheeseImage)
        cheeseImage.image = UIImage(named: "cheese")
        cheeseImage.frame = CGRect(x: 10, y: 10, width: 75, height: 75)
        cheeseView.addSubview(cheeseLabel)
        cheeseLabel.text = "Сырный бортик"
        cheeseLabel.frame = CGRect(x: 10, y: 100, width: 125, height: 15)
        cheeseLabel.font = UIFont.systemFont(ofSize: 13)
        cheeseView.addSubview(cheesePriceLabel)
        cheesePriceLabel.text = "169 ₽"
        cheesePriceLabel.frame = CGRect(x: 45, y: 120, width: 100, height: 25)
        cheesePriceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        cheeseView.layer.cornerRadius = 5
        cheeseView.layer.borderWidth = 3
        cheeseView.layer.borderColor = UIColor.systemGray3.cgColor
        let cheeseGesture = UITapGestureRecognizer(target: self, action: #selector(cheeseTap))
        cheeseView.isUserInteractionEnabled = true
        cheeseView.addGestureRecognizer(cheeseGesture)
        
        toppingsUIView.addSubview(vetchinaView)
        vetchinaView.frame = CGRect(x: 135, y: 0, width: 125, height: 150)
        vetchinaView.addSubview(vetchinaImage)
        vetchinaImage.image = UIImage(named: "vetchina")
        vetchinaImage.frame = CGRect(x: 10, y: 10, width: 75, height: 75)
        vetchinaView.addSubview(vetchinaLabel)
        vetchinaLabel.text = "Ветчина"
        vetchinaLabel.frame = CGRect(x: 10, y: 100, width: 100, height: 15)
        vetchinaLabel.textAlignment = .center
        vetchinaLabel.font = UIFont.systemFont(ofSize: 13)
        vetchinaView.addSubview(vetchinaPriceLabel)
        vetchinaPriceLabel.text = "189 ₽"
        vetchinaPriceLabel.frame = CGRect(x: 45, y: 120, width: 100, height: 25)
        vetchinaPriceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        vetchinaView.layer.cornerRadius = 5
        vetchinaView.layer.borderWidth = 3
        vetchinaView.layer.borderColor = UIColor.systemGray3.cgColor
        let vetchinaGesture = UITapGestureRecognizer(target: self, action: #selector(vetchinaTap))
        vetchinaView.isUserInteractionEnabled = true
        vetchinaView.addGestureRecognizer(vetchinaGesture)
        
        toppingsUIView.addSubview(perecView)
        perecView.frame = CGRect(x: 270, y: 0, width: 120, height: 150)
        perecView.addSubview(perecImage)
        perecImage.image = UIImage(named: "perec")
        perecImage.frame = CGRect(x: 10, y: 10, width: 75, height: 75)
        perecView.addSubview(perecLabel)
        perecLabel.text = "Перец"
        perecLabel.frame = CGRect(x: 10, y: 100, width: 100, height: 15)
        perecLabel.textAlignment = .center
        perecLabel.font = UIFont.systemFont(ofSize: 13)
        perecView.addSubview(perecPriceLabel)
        perecPriceLabel.text = "109 ₽"
        perecPriceLabel.frame = CGRect(x: 45, y: 120, width: 100, height: 25)
        perecPriceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        perecView.layer.cornerRadius = 5
        perecView.layer.borderWidth = 3
        perecView.layer.borderColor = UIColor.systemGray3.cgColor
        let perecGesture = UITapGestureRecognizer(target: self, action: #selector(perecTap))
        perecView.isUserInteractionEnabled = true
        perecView.addGestureRecognizer(perecGesture)
        
        
        self.view.addSubview(busketButton)
        busketButton.backgroundColor = .systemOrange
        busketButton.frame = CGRect(x: 20, y: 800, width: 390, height: 50)
        busketButton.layer.cornerRadius = 5
        busketButton.setTitleColor(.white, for: .normal)
        busketButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        busketButton.setTitle("В корзину за \(currentPrice) ₽", for: .normal)
        busketButton.addTarget(self, action: #selector(busketButtonTap), for: .touchUpInside)
        
    }
    
    @objc func sizeChanged() {
        switch sizeSegment.selectedSegmentIndex {
        case 0:
            self.pizzaParameters = "Маленькая 25см, \(testoType) тесто, 410 г"
            currentPrice = 245
            pizzaPrice = 245
        case 1:
            self.pizzaParameters = "Средняя 30 см, \(testoType) тесто, 610 г"
            currentPrice = 449
            pizzaPrice = 449
        case 2:
            self.pizzaParameters = "Большая 35 см, \(testoType) тесто, 800 г"
            currentPrice = 589
            pizzaPrice = 589
        default:
            break
        }
    }
    
    @objc func testoChangedValue(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.testoType = "традиционное"
        } else {
            self.testoType = "тонкое"
        }
    }
    
    @objc func cheeseTap(sender: UIView) {
        cheeseTopping.toggle()
        if cheeseTopping {
            currentPrice += 169
            items += 1
            cheeseView.layer.borderColor = UIColor.green.cgColor
        } else {
            currentPrice -= 169
            items -= 1
            cheeseView.layer.borderColor = UIColor.systemGray3.cgColor
        }
    }
    
    @objc func vetchinaTap(sender: UIView) {
        vetchinaTopping.toggle()
        if vetchinaTopping {
            currentPrice += 189
            items += 1
            vetchinaView.layer.borderColor = UIColor.green.cgColor
        } else {
            currentPrice -= 189
            items -= 1
            vetchinaView.layer.borderColor = UIColor.systemGray3.cgColor
        }
    }
    
    @objc func perecTap(sender: UIView) {
        perecTopping.toggle()
        if perecTopping {
            currentPrice += 109
            items += 1
            perecView.layer.borderColor = UIColor.green.cgColor
        } else {
            currentPrice -= 109
            items -= 1
            perecView.layer.borderColor = UIColor.systemGray3.cgColor
        }
    }
    
    @objc func busketButtonTap(sender: UIButton) {
        let vc = OplataViewController()
        vc.delegate = delegate
        vc.isCheese = cheeseTopping
        vc.isVetchina = vetchinaTopping
        vc.isPerec = perecTopping
        vc.price = currentPrice
        vc.items = items
        vc.pizzaDescription = pizzaParameters
        vc.pizzaName = pizzaName ?? ""
        vc.pizzaImageName = pizzaImageName ?? ""
        vc.pizzaPrice = pizzaPrice
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
