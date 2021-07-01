//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

class AlarmViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension CALayer {
var borderWidthIB: NSNumber {
    get {
        return NSNumber(value: Float(borderWidth))
    }
    set {
        borderWidth = CGFloat(newValue.floatValue)
    }
}
var borderColorIB: UIColor? {
    get {
        return borderColor != nil ? UIColor(cgColor: borderColor!) : nil
    }
    set {
        borderColor = newValue?.cgColor
    }
}
var cornerRadiusIB: NSNumber {
    get {
        return NSNumber(value: Float(cornerRadius))
    }
    set {
        cornerRadius = CGFloat(newValue.floatValue)
    }
}
