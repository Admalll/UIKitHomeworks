//
//  Model.swift
//  UIKitHomeworks
//
//  Created by Vlad on 22.06.2021.
//

import Foundation

class MessageModel {
    func returnMessage(message: String) -> String {
        switch message {
        case "leohl":
            return "hello"
        default:
            return message
        }
    }
}
