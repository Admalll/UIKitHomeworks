//
//  PlayerViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 25.06.2021.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var startSongTime: UILabel!
    @IBOutlet weak var endSongTime: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var songImageView: UIImageView!
    
    var player = AVAudioPlayer()
    var songName: String = ""
    var songType: String = ""
    var songPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            guard let audioPath = Bundle.main.path(forResource: songName, ofType: songType) else { return }
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            self.songImageView.image = UIImage(named: songName)
            setupPlayerView()
        } catch {
            print("Error")
        }
        
        var _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateDurationSlider), userInfo: nil, repeats: true)
    }
    
    func setupPlayerView() {
        songNameLabel.text = songName
        durationSlider.minimumValue = 0
        durationSlider.maximumValue = Float(player.duration)
        durationSlider.addTarget(self, action: #selector(durationSliderChanged), for: .valueChanged)
        endSongTime.text = player.duration.stringFromTimeInterval()
        durationSlider.setThumbImage(UIImage(systemName: "airplane")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    @objc func updateDurationSlider() {
        durationSlider.value = Float(player.currentTime)
        startSongTime.text = player.currentTime.stringFromTimeInterval()
    }
    
    @objc func durationSliderChanged(sender: UISlider) {
        if durationSlider == sender {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    
    @IBAction func playPauseButtonTap(_ sender: UIButton) {
        if songPlaying {
            songPlaying = false
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            player.pause()
        } else {
            songPlaying = true
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            player.play()
        }
    }
    
    @IBAction func closeButtonTap(_ sender: UIButton) {
        player.stop()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func volumeSliderChanged(_ sender: UISlider) {
        self.player.volume = self.volumeSlider.value
    }
    
    @IBAction func shareButtonTap(_ sender: UIButton) {
        let ac = UIActivityViewController(activityItems: [songName], applicationActivities: nil)
        self.present(ac, animated: true, completion: nil)
    }
    
    @IBAction func nextSongTap(_ sender: UIButton) {
        if songName == "СимплДимпл" {
            songName = "SimpleDimple"
        } else {
            songName = "СимплДимпл"
        }
        do {
            guard let audioPath = Bundle.main.path(forResource: songName, ofType: songType) else { return }
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            setupPlayerView()
            UIView.transition(with: self.songImageView,
                              duration: 1.0,
                              options: .transitionFlipFromLeft,
                              animations: {
                                self.songImageView.image = UIImage(imageLiteralResourceName: self.songName)
            }, completion: nil)
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } catch {
            print("Error")
        }
        
    }
}

extension TimeInterval{
    
    func stringFromTimeInterval() -> String {
        
        let time = NSInteger(self)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        
        return String(format: "%0.2d:%0.2d",minutes,seconds)
    }
}

