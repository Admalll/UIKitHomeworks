//
//  AuthModel.swift
//  UIKitHomeworks
//
//  Created by Vlad on 23.06.2021.
//

import Foundation

// 6.На свое усмотрение добавить свою фичу в приложение которое его улучшит

struct AuthModel {
    private let users = ["Login" : "123456"]
    
    func authUser(login: String, password: String) -> Bool {
        guard let userPassword = users[login] else { return false }
        return userPassword == password
    }
}
