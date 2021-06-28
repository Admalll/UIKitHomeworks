//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

class ItemsViewController: UIViewController {
    
    
    var itemsSegmentedControl = UISegmentedControl()
    var firstImageView = UIImageView()
    var secondImageView = UIImageView()
    var thirdImageView = UIImageView()
    var fourthImageView = UIImageView()
    var ourShopLabel = UILabel()
    var sortButton = UIButton()
    
    var firstUIView = UIView()
    var secondUIView = UIView()
    var thirdUIView = UIView()
    var fourthUIView = UIView()
    
    var itemsImagesArray = [(UIImage(named: "FirstMouse"), UIImage(named: "FirstMouse"), UIImage(named: "FirstMouse"), UIImage(named: "FirstMouse")),
                            (UIImage(named: "FirstKeyboard"), UIImage(named: "FirstKeyboard"), UIImage(named: "FirstKeyboard"), UIImage(named: "FirstKeyboard")),
                            (UIImage(named: "FirstMonitor"), UIImage(named: "FirstMonitor"), UIImage(named: "FirstMonitor"), UIImage(named: "FirstMonitor"))]
    var itemsMenuArray = ["Mouse", "Keyboard","Monitor"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
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
        let firstGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(uiviewTapped))
        firstUIView.addGestureRecognizer(firstGestureRecognizer)
        
        self.view.addSubview(firstImageView)
        firstImageView.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        firstImageView.image = itemsImagesArray.first?.0
        firstImageView.center = firstUIView.center
        
        self.view.addSubview(secondUIView)
        secondUIView.backgroundColor = .white
        secondUIView.frame = CGRect(x: 230, y: 250, width: 170, height: 250)
        secondUIView.layer.cornerRadius = 10
        secondUIView.isUserInteractionEnabled = true
        let secondGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(uiviewTapped))
        secondUIView.addGestureRecognizer(secondGestureRecognizer)
        
        self.view.addSubview(secondImageView)
        secondImageView.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        secondImageView.image = itemsImagesArray.first?.1
        secondImageView.center = secondUIView.center
        
        self.view.addSubview(thirdUIView)
        thirdUIView.backgroundColor = .white
        thirdUIView.frame = CGRect(x: 40, y: 520, width: 170, height: 250)
        thirdUIView.layer.cornerRadius = 10
        thirdUIView.isUserInteractionEnabled = true
        let thirdGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(uiviewTapped))
        thirdUIView.addGestureRecognizer(thirdGestureRecognizer)
        
        self.view.addSubview(thirdImageView)
        thirdImageView.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        thirdImageView.image = itemsImagesArray.first?.2
        thirdImageView.center = thirdUIView.center
        
        self.view.addSubview(fourthUIView)
        fourthUIView.backgroundColor = .white
        fourthUIView.frame = CGRect(x: 230, y: 520, width: 170, height: 250)
        fourthUIView.layer.cornerRadius = 10
        fourthImageView.isUserInteractionEnabled = true
        let fourthGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(uiviewTapped))
        fourthUIView.addGestureRecognizer(fourthGestureRecognizer)
        
        self.view.addSubview(fourthImageView)
        fourthImageView.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        fourthImageView.image = itemsImagesArray.first?.3
        fourthImageView.center = fourthUIView.center
        
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
        
        
    }
    
    @objc func uiviewTapped() {
        let currentItem = itemsMenuArray[itemsSegmentedControl.selectedSegmentIndex]
        let vc = DetailsViewController()
        vc.selectedItem = currentItem
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func changevalue(target: UISegmentedControl) {
        if target == itemsSegmentedControl {
            switch target.selectedSegmentIndex {
            case 0:
                firstImageView.image = itemsImagesArray[0].0
                secondImageView.image = itemsImagesArray[0].1
                thirdImageView.image = itemsImagesArray[0].2
                fourthImageView.image = itemsImagesArray[0].3
            case 1:
                firstImageView.image = itemsImagesArray[1].0
                secondImageView.image = itemsImagesArray[1].1
                thirdImageView.image = itemsImagesArray[1].2
                fourthImageView.image = itemsImagesArray[1].3
            case 2:
                firstImageView.image = itemsImagesArray[2].0
                secondImageView.image = itemsImagesArray[2].1
                thirdImageView.image = itemsImagesArray[2].2
                fourthImageView.image = itemsImagesArray[2].3
            default:
                break
            }
        }
    }
}
