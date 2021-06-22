//
//  MessageView.swift
//  UIKitHomeworks
//
//  Created by Vlad on 22.06.2021.
//

import UIKit

class MessageView: UIView {
    
    let messageLabel = UILabel()
    
    private func setupMessageLabel() {
        messageLabel.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        self.addSubview(messageLabel)
    }
    
    private func setupView() {
        self.backgroundColor = .white
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
