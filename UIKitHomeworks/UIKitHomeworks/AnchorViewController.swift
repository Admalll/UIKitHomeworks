//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

final class AnchorViewController: UIViewController {

    //MARK: - Visual components

    private let blackRectangleView = UIView()
    private let greenRectangleView = UIView()
    private let yellowRectangleView = UIView()
    private let redRectrangleView = UIView()
    private let constrainVCButton = UIButton()

    //MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    //MARK: - Private methods

    private func setupView() {
        setupRectangleViews()
        setupRectangleConstraints()
        setupConstrainVCButton()
    }

    private func setupConstrainVCButton() {
        constrainVCButton.setTitle("Constraint", for: .normal)
        constrainVCButton.backgroundColor = .systemBlue
        constrainVCButton.setTitleColor(.white, for: .normal)
        constrainVCButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(constrainVCButton)
        constrainVCButton.widthAnchor.constraint(equalTo: blackRectangleView.widthAnchor).isActive = true
        constrainVCButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        constrainVCButton.leftAnchor.constraint(equalTo: blackRectangleView.leftAnchor).isActive = true
        constrainVCButton.topAnchor.constraint(equalTo: blackRectangleView.bottomAnchor, constant: 50).isActive = true
        constrainVCButton.addTarget(self, action: #selector(constraintButtonTapped), for: .touchUpInside)
    }

    private func setupRectangleViews() {
        blackRectangleView.backgroundColor = .black
        blackRectangleView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blackRectangleView)

        redRectrangleView.backgroundColor = .red
        redRectrangleView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redRectrangleView)

        greenRectangleView.backgroundColor = .green
        greenRectangleView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greenRectangleView)

        yellowRectangleView.backgroundColor = .yellow
        yellowRectangleView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yellowRectangleView)

        setupRectangleConstraints()
    }

    private func setupRectangleConstraints() {
        blackRectangleView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        blackRectangleView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
        blackRectangleView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        blackRectangleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        redRectrangleView.heightAnchor.constraint(equalTo: blackRectangleView.heightAnchor, multiplier: 1/3, constant: -16).isActive = true
        redRectrangleView.widthAnchor.constraint(equalTo: blackRectangleView.widthAnchor, constant: -32).isActive = true
        redRectrangleView.centerXAnchor.constraint(equalTo: blackRectangleView.centerXAnchor).isActive = true
        redRectrangleView.topAnchor.constraint(equalTo: blackRectangleView.topAnchor, constant: 12).isActive = true

        yellowRectangleView.widthAnchor.constraint(equalTo: redRectrangleView.widthAnchor).isActive = true
        yellowRectangleView.topAnchor.constraint(equalTo: redRectrangleView.bottomAnchor, constant: 12).isActive = true
        yellowRectangleView.heightAnchor.constraint(equalTo: redRectrangleView.heightAnchor).isActive = true
        yellowRectangleView.leftAnchor.constraint(equalTo: redRectrangleView.leftAnchor).isActive = true

        greenRectangleView.widthAnchor.constraint(equalTo: redRectrangleView.widthAnchor).isActive = true
        greenRectangleView.heightAnchor.constraint(equalTo: redRectrangleView.heightAnchor).isActive = true
        greenRectangleView.leftAnchor.constraint(equalTo: redRectrangleView.leftAnchor).isActive = true
        greenRectangleView.bottomAnchor.constraint(equalTo: blackRectangleView.bottomAnchor, constant: -12).isActive = true
    }

    @objc private func constraintButtonTapped() {
        let vc = ConstraintsViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

