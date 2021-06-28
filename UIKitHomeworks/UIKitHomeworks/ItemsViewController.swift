//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

class ItemsViewController: UIViewController {
    
    
    //3.Доработать приложение которое было в уроке до уровня полноценного приложения. 3.Приложение должно быть на тематику бизнеса (Интернет магазин) 4.Требование не менее 3х эранов(контроллеров) 5.Обязательно должен присутствовать функционал весь который учили в новом курсе по UI.
    
    var itemsSegmentedControl = UISegmentedControl()
    var firstImageView = UIImageView()
    var secondImageView = UIImageView()
    var thirdImageView = UIImageView()
    var fourthImageView = UIImageView()
    var ourShopLabel = UILabel()
    var sortButton = UIButton()
    var sizeSlider = UISlider()
    var sizeSliderLabel = UILabel()
    var firstUIView = UIView()
    var secondUIView = UIView()
    var thirdUIView = UIView()
    var fourthUIView = UIView()
    var itemsImagesArray = [(UIImage(named: "Mouse1"), UIImage(named: "Mouse2"), UIImage(named: "Mouse3"), UIImage(named: "Mouse4")),
                            (UIImage(named: "Keyboard1"), UIImage(named: "Keyboard2"), UIImage(named: "Keyboard3"), UIImage(named: "Keyboard4")),
                            (UIImage(named: "Monitor1"), UIImage(named: "Monitor2"), UIImage(named: "Monitor3"), UIImage(named: "Monitor4"))]
    var itemsMenuArray = ["Mouse", "Keyboard","Monitor"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = .systemGray6
    }
    
    func setupView() {
        
        self.view.backgroundColor = .systemGray6
        itemsSegmentedControl = UISegmentedControl(items: itemsMenuArray)
        itemsSegmentedControl.frame = CGRect(x: 40, y: 175, width: 360, height: 30)
        itemsSegmentedControl.addTarget(self, action: #selector(changevalue), for: .valueChanged)
        itemsSegmentedControl.selectedSegmentIndex = 0
        self.view.addSubview(itemsSegmentedControl)
        
        self.view.addSubview(firstUIView)
        firstUIView.backgroundColor = .white
        firstUIView.frame = CGRect(x: 40, y: 250, width: 170, height: 250)
        firstUIView.layer.cornerRadius = 10
        firstUIView.isUserInteractionEnabled = true
        let firstGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(firstUiviewTapped))
        firstUIView.addGestureRecognizer(firstGestureRecognizer)
        
        self.view.addSubview(firstImageView)

        
        self.view.addSubview(secondUIView)
        secondUIView.backgroundColor = .white
        secondUIView.frame = CGRect(x: 230, y: 250, width: 170, height: 250)
        secondUIView.layer.cornerRadius = 10
        secondUIView.isUserInteractionEnabled = true
        let secondGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(secondtUiviewTapped))
        secondUIView.addGestureRecognizer(secondGestureRecognizer)
        
        self.view.addSubview(secondImageView)
        
        
        self.view.addSubview(thirdUIView)
        thirdUIView.backgroundColor = .white
        thirdUIView.frame = CGRect(x: 40, y: 520, width: 170, height: 250)
        thirdUIView.layer.cornerRadius = 10
        thirdUIView.isUserInteractionEnabled = true
        let thirdGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(thirdUiviewTapped))
        thirdUIView.addGestureRecognizer(thirdGestureRecognizer)
        
        self.view.addSubview(thirdImageView)
        
        self.view.addSubview(fourthUIView)
        fourthUIView.backgroundColor = .white
        fourthUIView.frame = CGRect(x: 230, y: 520, width: 170, height: 250)
        fourthUIView.layer.cornerRadius = 10
        fourthImageView.isUserInteractionEnabled = true
        let fourthGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(fourthUiviewTapped))
        fourthUIView.addGestureRecognizer(fourthGestureRecognizer)
        
        self.view.addSubview(fourthImageView)
        setImages(index: 0)
        
        resizeImages(width: 150, height: 100)
        
        self.view.addSubview(ourShopLabel)
        ourShopLabel.text = "Best devices"
        ourShopLabel.font = UIFont.boldSystemFont(ofSize: 28)
        ourShopLabel.frame = CGRect(x: 40, y: 120, width: 300, height: 30)
        
        self.view.addSubview(sortButton)
        sortButton.frame = CGRect(x: 300, y: 120, width: 100, height: 30)
        sortButton.setImage(UIImage(systemName: "chevron.compact.down")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        sortButton.setTitle("Sort by", for: .normal)
        sortButton.setTitleColor(.gray, for: .normal)
        sortButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 0)
        
        self.view.addSubview(sizeSlider)
        sizeSlider.frame = CGRect(x: 40, y: 830, width: 360, height: 40)
        sizeSlider.minimumValue = 0
        sizeSlider.maximumValue = 2
        sizeSlider.setValue(0, animated: false)
        sizeSlider.addTarget(self, action: #selector(changeSizes), for: .valueChanged)
        sizeSliderLabel.text = "Fonts size: Small"
        
        self.view.addSubview(sizeSliderLabel)
        sizeSliderLabel.frame = CGRect(x: 40, y: 800, width: 360, height: 40)
    }
    
    @objc func changeSizes(sender: UISlider) {
        if sender == sizeSlider {
            switch Int(sender.value) {
            case 0:
                sortButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
                ourShopLabel.font = UIFont.boldSystemFont(ofSize: 28)
                itemsSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)], for: .normal)
                sizeSliderLabel.text = "Fonts size: Small"
                resizeImages(width: 150, height: 100)
            case 1:
                sortButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
                ourShopLabel.font = UIFont.boldSystemFont(ofSize: 34)
                itemsSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)], for: .normal)
                sizeSliderLabel.text = "Fonts size: Medium"
                resizeImages(width: 168, height: 112)
            case 2:
                sortButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
                ourShopLabel.font = UIFont.boldSystemFont(ofSize: 38)
                itemsSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24)], for: .normal)
                sizeSliderLabel.text = "Fonts size: Large"
                resizeImages(width: 170, height: 125)
            default:
                break
            }
        }
    }

    private func resizeImages(width: Int, height: Int) {
        firstImageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        firstImageView.center = firstUIView.center
        secondImageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        secondImageView.center = secondUIView.center
        thirdImageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        thirdImageView.center = thirdUIView.center
        fourthImageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        fourthImageView.center = fourthUIView.center
    }
    
    @objc func firstUiviewTapped() {
        let currentItem = itemsMenuArray[itemsSegmentedControl.selectedSegmentIndex] + "1"
        let vc = DetailsViewController()
        vc.selectedItem = currentItem
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func secondtUiviewTapped() {
        let currentItem = itemsMenuArray[itemsSegmentedControl.selectedSegmentIndex] + "2"
        let vc = DetailsViewController()
        vc.selectedItem = currentItem
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func thirdUiviewTapped() {
        let currentItem = itemsMenuArray[itemsSegmentedControl.selectedSegmentIndex] + "3"
        let vc = DetailsViewController()
        vc.selectedItem = currentItem
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func fourthUiviewTapped() {
        let currentItem = itemsMenuArray[itemsSegmentedControl.selectedSegmentIndex] + "4"
        let vc = DetailsViewController()
        vc.selectedItem = currentItem
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setImages(index: Int) {
        firstImageView.image = itemsImagesArray[index].0
        secondImageView.image = itemsImagesArray[index].1
        thirdImageView.image = itemsImagesArray[index].2
        fourthImageView.image = itemsImagesArray[index].3
    }
    
    @objc func changevalue(target: UISegmentedControl) {
        if target == itemsSegmentedControl {
            switch target.selectedSegmentIndex {
            case 0:
                setImages(index: 0)
            case 1:
                setImages(index: 1)
            case 2:
                setImages(index: 2)
            default:
                break
            }
        }
    }
}
