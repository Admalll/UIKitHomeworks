//
//  PizzaViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 30.06.2021.
//

import UIKit

final class PizzaViewController: UIViewController {
    
    // 3. Создать на экране два вида пиццы, с разными названиями и картинками, вверху экране вместо кнопки назад должна быть просто стрелка (как в дизайне), при нажатии на кнопку добавить (+) переходим на следующий экран выбора ингредиентов (отображаем модально)
    
    //MARK: - Public properties
    
    var delegate: OplataDelegate?
    
    //MARK: - Visual components
    
    private let bbqUIView = UIView()
    private let bbqImage = UIImageView()
    private let bbqNameLabel = UILabel()
    private let bbqDescriptionLabel = UILabel()
    private let bbqPriceButton = UIButton()
    private let freshUIView = UIView()
    private let freshImage = UIImageView()
    private let freshNameLabel = UILabel()
    private let freshDescriptionLabel = UILabel()
    private let freshPriceButton = UIButton()
    
    //MARK: - UIViewController(PizzaViewController)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = .systemGray6
        self.navigationController?.navigationBar.tintColor = .black
        self.title = "Pizza"
    }
    
    //MARK: - Public methods
    
    func setupView() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(bbqUIView)
        bbqUIView.frame = CGRect(x: 20, y: 100, width: 390, height: 175)
        bbqUIView.addSubview(bbqImage)
        bbqImage.frame = CGRect(x: 0, y: 0, width: 175, height: 175)
        bbqImage.backgroundColor = .gray
        bbqImage.image = UIImage(named: "bbq")
        bbqUIView.addSubview(bbqNameLabel)
        bbqNameLabel.text = "Колбаски Барбекю"
        bbqNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        bbqNameLabel.frame = CGRect(x: 170, y: 25, width: 200, height: 20)
        bbqUIView.addSubview(bbqDescriptionLabel)
        bbqDescriptionLabel.text = "Острая чоризо, соус барбекю, томаты, красный лук, моцарелла, томатный соус"
        bbqDescriptionLabel.numberOfLines = 3
        bbqDescriptionLabel.font = UIFont.systemFont(ofSize: 13)
        bbqDescriptionLabel.textColor = .gray
        bbqDescriptionLabel.frame = CGRect(x: 170, y: 25, width: 225, height: 100)
        bbqUIView.addSubview(bbqPriceButton)
        bbqPriceButton.setTitle("от 395 ₽", for: .normal)
        bbqPriceButton.backgroundColor = .white
        bbqPriceButton.tintColor = .systemOrange
        bbqPriceButton.setTitleColor(.systemOrange, for: .normal)
        bbqPriceButton.layer.cornerRadius = 5
        bbqPriceButton.layer.borderColor = UIColor.systemOrange.cgColor
        bbqPriceButton.layer.borderWidth = 1
        bbqPriceButton.frame = CGRect(x: 170, y: 110, width: 100, height: 30)
        bbqPriceButton.addTarget(self, action: #selector(openPizzaSetup(sender:)), for: .touchUpInside)
        
        self.view.addSubview(freshUIView)
        freshUIView.frame = CGRect(x: 20, y: 300, width: 390, height: 175)
        freshUIView.addSubview(freshImage)
        freshImage.frame = CGRect(x: 13, y: 0, width: 137, height: 150)
        freshImage.backgroundColor = .gray
        freshImage.image = UIImage(named: "fresh")
        freshUIView.addSubview(freshNameLabel)
        freshNameLabel.text = "Пепперони фреш"
        freshNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        freshNameLabel.frame = CGRect(x: 170, y: 25, width: 200, height: 20)
        freshUIView.addSubview(freshDescriptionLabel)
        freshDescriptionLabel.text = "Пикантная пепперони, увеличенная порция моцареллы, томаты, томатный соус"
        freshDescriptionLabel.numberOfLines = 3
        freshDescriptionLabel.font = UIFont.systemFont(ofSize: 13)
        freshDescriptionLabel.textColor = .gray
        freshDescriptionLabel.frame = CGRect(x: 170, y: 25, width: 225, height: 100)
        freshUIView.addSubview(freshPriceButton)
        freshPriceButton.setTitle("от 245 ₽", for: .normal)
        freshPriceButton.backgroundColor = .white
        freshPriceButton.tintColor = .systemOrange
        freshPriceButton.setTitleColor(.systemOrange, for: .normal)
        freshPriceButton.layer.cornerRadius = 5
        freshPriceButton.layer.borderColor = UIColor.systemOrange.cgColor
        freshPriceButton.layer.borderWidth = 1
        freshPriceButton.frame = CGRect(x: 170, y: 110, width: 100, height: 30)
        freshPriceButton.addTarget(self, action: #selector(openPizzaSetup(sender:)), for: .touchUpInside)
    }
    
    @objc func openPizzaSetup(sender: UIButton) {
        switch sender {
        case bbqPriceButton:
            let vc = DetailsPizzaViewController(name: "Колбаски Барбекю", image: "bbq", description: "Острая чоризо, соус барбекю, томаты, красный лук, моцарелла, томатный соус", frame: .zero)
            vc.delegate = delegate
            let navigation = UINavigationController(rootViewController: vc)
            self.navigationController?.present(navigation, animated: true, completion: nil)
        case freshPriceButton:
            let vc = DetailsPizzaViewController(name: "Пепперони фреш", image: "fresh", description: "Пикантная пепперони, увеличенная порция моцареллы, томаты, томатный соус", frame: .zero)
            vc.delegate = delegate
            let navigation = UINavigationController(rootViewController: vc)
            self.navigationController?.present(navigation, animated: true, completion: nil)
        default:
            break
        }
    }
}
