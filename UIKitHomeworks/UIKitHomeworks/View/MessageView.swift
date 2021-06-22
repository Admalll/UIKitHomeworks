//
//  MessageView.swift
//  UIKitHomeworks
//
//  Created by Vlad on 22.06.2021.
//

import UIKit

class MessageView: UIView {
    
    var controller: ViewController!
    let messageLabel = UILabel()
    let messageButton = UIButton()
    
    private func setupMessageLabel() {
        messageLabel.frame = CGRect(x: 130, y: 100, width: 100, height: 100)
        self.addSubview(messageLabel)
        self.addSubview(messageButton)
    }
    
    private func setupView() {
        self.backgroundColor = .white
        messageButton.frame = CGRect(x: 130, y: 200, width: 200, height: 200)
        messageButton.setTitle("Start", for: .normal)
        messageButton.backgroundColor = .red
        setupMessageLabel()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
