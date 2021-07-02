//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

final class CountryViewController: UIViewController {
    
    //MARK: - Visual components
    
    private let countriesTable = UITableView()
    private let titleLabel = UILabel()
    
    //MARK: - Public properties
    
    private let countries = ["🇷🇺 Россия", "🇧🇾 Беларусь", "🇬🇧 Великобритания", "🇩🇪 Германия", "🇰🇿 Казахстан", "🇰🇬 Кыргызстан", "🇱🇹 Лива", "🇳🇬 Нигерия", "🇷🇴 Румыния", "🇸🇮 Словения", "🇺🇿 Узбекистан", "🇪🇪 Эстония"]
    
    //MARK: - UIViewController(CountryViewController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countriesTable.delegate = self
        countriesTable.dataSource = self
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
        
        self.view.addSubview(countriesTable)
        countriesTable.frame = CGRect(x: 20, y: 150, width: 400, height: 700)
        
        self.view.addSubview(titleLabel)
        titleLabel.text = "Страны"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        titleLabel.frame = CGRect(x: 40, y: 100, width: 360, height: 50)
    }
    
    func openMenu() {
        let vc = MenuViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension CountryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = UITableViewCell()
        row.textLabel?.text = countries[indexPath.row]
        return row
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            openMenu()
        default:
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}
