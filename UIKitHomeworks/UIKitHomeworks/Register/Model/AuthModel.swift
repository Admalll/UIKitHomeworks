//
//  AuthModel.swift
//  UIKitHomeworks
//
//  Created by Vlad on 06.07.2021.
//

import Foundation

struct User {
    var name: String
    var age: String
    var nickname: String
    var registrationParameter: RegistationParameter
    let id: Int
}

enum RegistationParameter {
    case phoneNumber(String)
    case emailAddress(String)
}

struct Auth {
    var users = [User(name: "User", age: "10", nickname: "User", registrationParameter: .emailAddress("user@user.ru"), id: 0)]
    private var userNicknames = ["User"]

    mutating func registerNewUser(user: User) -> Bool {
        if let _ = userNicknames.firstIndex(of: user.nickname) {
            return false
        } else {
            users.append(user)
            userNicknames += [user.nickname]
            return true
        }
    }
}
