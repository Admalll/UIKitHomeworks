//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

class MusicsViewController: UIViewController {
    
    // 1 Создать экран, который содержит картинку альбома, название песни и ее длительность (захардкодить)

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
    
    // 2 При нажатии на песню попадаем на следующий экран (модально отображаем его не на весь экран)
    
    // 5 Для проигрывания песен скачать 2 любых mp3 песни
    // 6 При нажатии на первую песню играет одна песня, при нажатии на вторую играет вторая песня
    
    // 8 Перебрасывать название песни с первого экрана на второй
    
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

