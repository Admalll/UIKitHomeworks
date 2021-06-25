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
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstLabel()
        setupSecondLabel()
    }
    
    func setupFirstLabel() {
        let firstGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(firstSongTapped))
        firstSongLabel.addGestureRecognizer(firstGestureRecognizer)
    }
    
    func setupSecondLabel() {
        let secondGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(secondSongTapped))
        secondSongLabel.addGestureRecognizer(secondGestureRecognizer)
    }
    
    @objc func firstSongTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = storyboard.instantiateViewController(identifier: "player") as? PlayerViewController else { return }
        secondVC.songName = "SimpleDimple"
        secondVC.songType = ".mp3"
        self.show(secondVC, sender: self)
    }
    
    @objc func secondSongTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = storyboard.instantiateViewController(identifier: "player") as? PlayerViewController else { return }
        secondVC.songName = "СимплДимпл"
        secondVC.songType = ".mp3"
        self.show(secondVC, sender: self)
    }
}

