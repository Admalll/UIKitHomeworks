//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

class MusicsViewController: UIViewController {

    @IBOutlet weak var firstSongLabel: UILabel!
    @IBOutlet weak var secondSongLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        let firstGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(firstSongTapped))
        firstSongLabel.addGestureRecognizer(firstGestureRecognizer)
        let secondGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(secondSongTapped))
        secondSongLabel.addGestureRecognizer(secondGestureRecognizer)
    }
    
    @objc func firstSongTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "player")
        self.show(secondVC, sender: self)
    }
    
    @objc func secondSongTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "player")
        self.show(secondVC, sender: self)
    }
}

