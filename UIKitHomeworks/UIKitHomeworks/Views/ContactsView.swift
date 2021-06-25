//
//  ContactsView.swift
//  UIKitHomeworks
//
//  Created by Vlad on 24.06.2021.
//

import UIKit

class ContactsView: UIView {
    
    let avatarImageOne = UIImageView()
    let avatarImageTwo = UIImageView()
    let avatarImageThree = UIImageView()
    
    let contactNameOne = UILabel()
    let contactNameTwo = UILabel()
    let contactNameThree = UILabel()
    
    let birthDescriptionOne = UILabel()
    let birthDescriptionTwo = UILabel()
    let birthDescriptionThree = UILabel()
    
    let birthDaysOne = UILabel()
    let birthDaysTwo = UILabel()
    let birthDaysThree = UILabel()
    
    let underLineOne = UIView()
    let underLineTwo = UIView()
    let underLineThree = UIView()
    
    func setupView() {
        
        self.backgroundColor = .white
        let greyPersonImage = UIImage(systemName: "person.circle.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        
        self.addSubview(avatarImageOne)
        avatarImageOne.image = greyPersonImage
        avatarImageOne.frame = CGRect(x: 10, y: 150, width: 75, height: 75)
        
        self.addSubview(contactNameOne)
        contactNameOne.text = "Jeremy"
        contactNameOne.font = UIFont.boldSystemFont(ofSize: 20)
        contactNameOne.frame = CGRect(x: 90, y: 155, width: 100, height: 30)
        
        self.addSubview(birthDescriptionOne)
        birthDescriptionOne.text = "10 марта, в среду исполнится 25 лет"
        birthDescriptionOne.font = UIFont.systemFont(ofSize: 16)
        birthDescriptionOne.textColor = .gray
        birthDescriptionOne.frame = CGRect(x: 90, y: 185, width: 350, height: 20)
        
        self.addSubview(birthDaysOne)
        birthDaysOne.text = "18 дней"
        birthDaysOne.font = UIFont.systemFont(ofSize: 16)
        birthDaysOne.textColor = .gray
        birthDaysOne.frame = CGRect(x: 340, y: 155, width: 100, height: 20)
        
        self.addSubview(underLineOne)
        underLineOne.backgroundColor = .gray
        underLineOne.frame = CGRect(x: 35, y: 230, width: 400, height: 1)
        
        self.addSubview(avatarImageTwo)
        avatarImageTwo.image = greyPersonImage
        avatarImageTwo.frame = CGRect(x: 10, y: 250, width: 75, height: 75)
        
        self.addSubview(contactNameTwo)
        contactNameTwo.text = "Maria Lui"
        contactNameTwo.font = UIFont.boldSystemFont(ofSize: 20)
        contactNameTwo.frame = CGRect(x: 90, y: 255, width: 100, height: 30)
        
        self.addSubview(birthDescriptionTwo)
        birthDescriptionTwo.text = "30 марта, в четверг исполнится 20 лет"
        birthDescriptionTwo.font = UIFont.systemFont(ofSize: 16)
        birthDescriptionTwo.textColor = .gray
        birthDescriptionTwo.frame = CGRect(x: 90, y: 285, width: 350, height: 20)
        
        self.addSubview(birthDaysTwo)
        birthDaysTwo.text = "28 дней"
        birthDaysTwo.font = UIFont.systemFont(ofSize: 16)
        birthDaysTwo.textColor = .gray
        birthDaysTwo.frame = CGRect(x: 340, y: 255, width: 100, height: 20)
        
        self.addSubview(underLineTwo)
        underLineTwo.backgroundColor = .gray
        underLineTwo.frame = CGRect(x: 35, y: 340, width: 400, height: 1)
        
        self.addSubview(avatarImageThree)
        avatarImageThree.image = greyPersonImage
        avatarImageThree.frame = CGRect(x: 10, y: 350, width: 75, height: 75)
        
        self.addSubview(contactNameThree)
        contactNameThree.text = "Jony Stark"
        contactNameThree.font = UIFont.boldSystemFont(ofSize: 20)
        contactNameThree.frame = CGRect(x: 90, y: 355, width: 100, height: 30)
        
        self.addSubview(birthDescriptionThree)
        birthDescriptionThree.text = "20 апреля, в субботу исполнится 25 лет"
        birthDescriptionThree.font = UIFont.systemFont(ofSize: 16)
        birthDescriptionThree.textColor = .gray
        birthDescriptionThree.frame = CGRect(x: 90, y: 385, width: 350, height: 20)
        
        self.addSubview(birthDaysThree)
        birthDaysThree.text = "53 дней"
        birthDaysThree.font = UIFont.systemFont(ofSize: 16)
        birthDaysThree.textColor = .gray
        birthDaysThree.frame = CGRect(x: 340, y: 355, width: 100, height: 20)
        
        self.addSubview(underLineThree)
        underLineThree.backgroundColor = .gray
        underLineThree.frame = CGRect(x: 35, y: 340, width: 400, height: 1)
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
