//
//  UIArrengedViewsView.swift
//  UIKitHomeworks
//
//  Created by Vlad on 08.07.2021.
//

import UIKit

final class UIArrangedViewsView: UIView {
    func addArrangedView(_ view: UIView) {
        let yAxis = subviews.last?.frame.maxY ?? 0
        view.frame.origin = CGPoint(x: 0, y: yAxis + 8)
        addSubview(view)
    }
}
