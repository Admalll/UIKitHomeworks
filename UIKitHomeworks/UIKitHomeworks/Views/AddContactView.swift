//
//  AddView.swift
//  UIKitHomeworks
//
//  Created by Vlad on 24.06.2021.
//

import UIKit

class AddContactView: UIView {
    
    weak var delegate: AddContactViewDelegate?
    let addContactButton = UIButton()
    let closeButton = UIButton()
    let personaImage = UIImageView()
    let editAvatarButton = UIButton()
    let nameLabel = UILabel()
    let nameTextfield = UITextField()
    let nameUnderline = UIView()
    let dateLabel = UILabel()
    let datePicker = UITextField()
    let dateUnderline = UIView()
    let ageLabel = UILabel()
    let ageTextfield = UIAgePickerTextField()
    let ageUnderline = UIView()
    let sexLabel = UILabel()
    let sexPicker = UISexPickerTextField()
    let sexUnderline = UIView()
    let instagramLabel = UILabel()
    let instagramTextfield = UITextField()
    let instagramUnderline = UIView()
    let datePickerdate = UIDatePicker()
    
    func setupView() {
        
        self.backgroundColor = .white
        
        self.addSubview(addContactButton)
        addContactButton.setTitle("Добавить", for: .normal)
        addContactButton.setTitleColor(.systemBlue, for: .normal)
        addContactButton.frame = CGRect(x: 290, y: 30, width: 100, height: 20)
        addContactButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.delegate?.closeModal()
        }), for: .touchUpInside)
        self.addSubview(closeButton)
        closeButton.setTitle("Отмена", for: .normal)
        closeButton.setTitleColor(.systemBlue, for: .normal)
        closeButton.frame = CGRect(x: 20, y: 30, width: 100, height: 20)
        closeButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.delegate?.closeModal()
        }), for: .touchUpInside)
        
        let personaAvatar = UIImage(systemName: "person.circle.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        
        self.addSubview(personaImage)
        personaImage.image = personaAvatar
        personaImage.frame = CGRect(x: 145, y: 50, width: 150, height: 150)
        
        self.addSubview(editAvatarButton)
        editAvatarButton.setTitle("Изменить фото", for: .normal)
        editAvatarButton.setTitleColor(.systemBlue, for: .normal)
        editAvatarButton.frame = CGRect(x: 145, y: 215, width: 150, height: 20)
        
        self.addSubview(nameLabel)
        nameLabel.text = "Имя"
        nameLabel.textColor = .systemBlue
        nameLabel.frame = CGRect(x: 25, y: 265, width: 100, height: 20)
        
        self.addSubview(nameTextfield)
        nameTextfield.placeholder = "Введите имя"
        nameTextfield.frame = CGRect(x: 25, y: 295, width: 350, height: 30)
        
        self.addSubview(nameUnderline)
        nameUnderline.backgroundColor = .gray
        nameUnderline.frame = CGRect(x: 25, y: 327, width: nameTextfield.frame.width, height: 1)
        
        self.addSubview(dateLabel)
        dateLabel.text = "Дата"
        dateLabel.textColor = .systemBlue
        dateLabel.frame = CGRect(x: 25, y: 367, width: 100, height: 20)
        
        self.addSubview(datePicker)
        datePicker.frame = CGRect(x: 25, y: 397, width: 350, height: 30)
        datePicker.placeholder = "Выберите дату"
        datePickerdate.preferredDatePickerStyle = .wheels
        let dateToolbar = UIToolbar()
        dateToolbar.sizeToFit()
        let dateDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(dateDonePressed))
        dateToolbar.setItems([dateDoneButton], animated: true)
        datePicker.inputAccessoryView = dateToolbar
        datePicker.inputView = datePickerdate
        
        
        self.addSubview(dateUnderline)
        dateUnderline.backgroundColor = .gray
        dateUnderline.frame = CGRect(x: 25, y: 429, width: 350, height: 1)
        
        self.addSubview(ageLabel)
        ageLabel.text = "Возраст"
        ageLabel.textColor = .systemBlue
        ageLabel.frame = CGRect(x: 25, y: 469, width: 100, height: 20)
        
        self.addSubview(ageTextfield)
        ageTextfield.placeholder = "Введите возраст"
        ageTextfield.frame = CGRect(x: 25, y: 499, width: 350, height: 30)
        
        self.addSubview(ageUnderline)
        ageUnderline.backgroundColor = .gray
        ageUnderline.frame = CGRect(x: 25, y: 531, width: 350, height: 1)
        
        self.addSubview(sexLabel)
        sexLabel.text = "Пол"
        sexLabel.textColor = .systemBlue
        sexLabel.frame = CGRect(x: 25, y: 571, width: 100, height: 20)
        
        self.addSubview(sexPicker)
        sexPicker.frame = CGRect(x: 25, y: 601, width: 350, height: 30)
        sexPicker.placeholder = "Выберите пол"
        
        self.addSubview(sexUnderline)
        sexUnderline.backgroundColor = .gray
        sexUnderline.frame = CGRect(x: 25, y: 633, width: 350, height: 1)
        
        self.addSubview(instagramLabel)
        instagramLabel.text = "Instagram"
        instagramLabel.textColor = .systemBlue
        instagramLabel.frame = CGRect(x: 25, y: 673, width: 100, height: 20)
        
        self.addSubview(instagramTextfield)
        instagramTextfield.frame = CGRect(x: 25, y: 703, width: 350, height: 30)
        instagramTextfield.placeholder = "Введите Instragram"
        instagramTextfield.addAction(UIAction(handler: { _ in
            self.tapInstagram()
        }), for: .editingDidBegin)
        
        self.addSubview(instagramUnderline)
        instagramUnderline.backgroundColor = .gray
        instagramUnderline.frame = CGRect(x: 25, y: 735, width: 350, height: 1)
        
    }
    
    @objc func dateDonePressed() {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        datePicker.text = "\(formatter.string(from: datePickerdate.date))"
        self.endEditing(true)
    }
    
    func tapInstagram() {
        delegate?.openInstagramAlert()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

protocol AddContactViewDelegate: AnyObject {
    func openInstagramAlert()
    func closeModal()
}
