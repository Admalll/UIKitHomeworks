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



//6 Нужно ввести "leohl" в Алерт нажимаете "ок" отдаете
//контролеру а контролер отдаст это в модель которая
//из буквосочетания "leohl" вернет слово "hello"
//контролеру а контролер отдаст это лейблу и отобразит
//это на экране
