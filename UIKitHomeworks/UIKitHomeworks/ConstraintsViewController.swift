//
//  ConstraintsViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 31.07.2021.
//

import UIKit

final class ConstraintsViewController: UIViewController {

    //MARK: - Visual Components

    private let blackRectangleView = UIView()
    private let greenRectangleView = UIView()
    private let yellowRectangleView = UIView()
    private let redRectrangleView = UIView()
    private let dismissButton = UIButton()

    //MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    //MARK: - Private methods

    private func setupView() {
        view.backgroundColor = .white

        setupRectanglesViews()
        setupDismissButton()
    }

    private func setupRectanglesViews() {
        blackRectangleView.backgroundColor = .black
        blackRectangleView.translatesAutoresizingMaskIntoConstraints = false

        redRectrangleView.backgroundColor = .red
        redRectrangleView.translatesAutoresizingMaskIntoConstraints = false

        yellowRectangleView.backgroundColor = .yellow
        yellowRectangleView.translatesAutoresizingMaskIntoConstraints = false

        greenRectangleView.backgroundColor = .green
        greenRectangleView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(blackRectangleView)
        view.addSubview(redRectrangleView)
        view.addSubview(greenRectangleView)
        view.addSubview(yellowRectangleView)

        setupRectanglesConstraints()
    }

    private func setupRectanglesConstraints() {
        setupBlackRectangleViewConstraints()
        setupRedRectangleViewConstaints()
        setupYellowRectangleViewConstraints()
        setupGreenRectangleViewConstraints()
    }

    private func setupBlackRectangleViewConstraints() {
        NSLayoutConstraint.init(item: blackRectangleView,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .width,
                                multiplier: 1/2,
                                constant: 0).isActive = true

        NSLayoutConstraint.init(item: blackRectangleView,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .height,
                                multiplier: 1/2,
                                constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: blackRectangleView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0).isActive = true

        NSLayoutConstraint.init(item: blackRectangleView,
                                attribute: .centerY,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerY,
                                multiplier: 1,
                                constant: 0).isActive = true
    }

    private func setupRedRectangleViewConstaints() {
        NSLayoutConstraint.init(item: redRectrangleView,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: blackRectangleView,
                                attribute: .height,
                                multiplier: 1/3,
                                constant: -16).isActive = true

        NSLayoutConstraint.init(item: redRectrangleView,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: blackRectangleView,
                                attribute: .width,
                                multiplier: 1,
                                constant: -32).isActive = true

        NSLayoutConstraint.init(item: redRectrangleView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: blackRectangleView,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0).isActive = true

        NSLayoutConstraint.init(item: redRectrangleView,
                                attribute: .top,
                                relatedBy: .equal,
                                toItem: blackRectangleView,
                                attribute: .top,
                                multiplier: 1,
                                constant: 12).isActive = true
    }

    private func setupYellowRectangleViewConstraints() {
        NSLayoutConstraint.init(item: yellowRectangleView,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: redRectrangleView,
                                attribute: .height,
                                multiplier: 1,
                                constant: 0).isActive = true

        NSLayoutConstraint.init(item: yellowRectangleView,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: redRectrangleView,
                                attribute: .width,
                                multiplier: 1,
                                constant: 0).isActive = true

        NSLayoutConstraint.init(item: yellowRectangleView,
                                attribute: .left,
                                relatedBy: .equal,
                                toItem: redRectrangleView,
                                attribute: .left,
                                multiplier: 1,
                                constant: 0).isActive = true

        NSLayoutConstraint.init(item: yellowRectangleView,
                                attribute: .top,
                                relatedBy: .equal,
                                toItem: redRectrangleView,
                                attribute: .bottom,
                                multiplier: 1,
                                constant: 12).isActive = true
    }

    private func setupGreenRectangleViewConstraints() {
        NSLayoutConstraint.init(item: greenRectangleView,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: redRectrangleView,
                                attribute: .height,
                                multiplier: 1,
                                constant: 0).isActive = true

        NSLayoutConstraint.init(item: greenRectangleView,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: redRectrangleView,
                                attribute: .width,
                                multiplier: 1,
                                constant: 0).isActive = true

        NSLayoutConstraint.init(item: greenRectangleView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: blackRectangleView,
                                attribute: .bottom,
                                multiplier: 1,
                                constant: -12).isActive = true

        NSLayoutConstraint.init(item: greenRectangleView,
                                attribute: .left,
                                relatedBy: .equal,
                                toItem: redRectrangleView,
                                attribute: .left,
                                multiplier: 1,
                                constant: 0).isActive = true
    }

    private func setupDismissButton() {
        dismissButton.backgroundColor = .systemBlue
        dismissButton.setTitle("Anchor", for: .normal)
        dismissButton.setTitleColor(.white, for: .normal)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        view.addSubview(dismissButton)

        NSLayoutConstraint.init(item: dismissButton,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: blackRectangleView,
                                attribute: .width,
                                multiplier: 1,
                                constant: 0).isActive = true

        NSLayoutConstraint.init(item: dismissButton,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: nil,
                                attribute: .width,
                                multiplier: 1,
                                constant: 50).isActive = true

        NSLayoutConstraint.init(item: dismissButton,
                                attribute: .top,
                                relatedBy: .equal,
                                toItem: blackRectangleView,
                                attribute: .bottom,
                                multiplier: 1,
                                constant: 50).isActive = true

        NSLayoutConstraint.init(item: dismissButton,
                                attribute: .left,
                                relatedBy: .equal,
                                toItem: blackRectangleView,
                                attribute: .left,
                                multiplier: 1,
                                constant: 0).isActive = true
    }

    @objc private func dismissButtonTapped() {
        dismiss(animated: true)
    }
}
