//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

final class StopwatchViewController: UIViewController {

    //MARK: - IBOutlets

    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var timerLabel: UILabel!
    @IBOutlet private weak var arrangedViewsView: UIArrangedViewsView!

    //MARK: - Private properties

    private var isTimerActive = false
    private var timer = Timer()
    private var currentTimeInterval = TimeInterval()
    private var currentLap = 0

    //MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - IBActions

    @IBAction private func startButtonTapped(_ sender: UIButton) {
        isTimerActive.toggle()
        updateStartButton()
        setupTimer()
    }

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        arrangedViewsView.subviews.forEach { $0.removeFromSuperview() }
        currentLap = 0
    }

    //MARK: - Private methods

    private func updateStartButton() {
        if isTimerActive {
            startButton.setTitle("STOP", for: .normal)
        } else {
            startButton.setTitle("START", for: .normal)
        }
    }

    private func setupTimer() {
        isTimerActive ? runTimer() : stopTimer()
    }

    private func stopTimer() {
        timer.invalidate()
        addTimerResult(timeInterval: currentTimeInterval)
        currentTimeInterval = 0
        updateTimerLabel()
    }

    private func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                                 target: self,
                                                 selector: #selector(updateTimer),
                                                 userInfo: nil, repeats: true)
    }

    private func updateTimerLabel() {
        timerLabel.text = currentTimeInterval.stringFromTimeInterval()
    }

    private func addTimerResult(timeInterval: TimeInterval) {
        let label = createLabelResult(timeInterval: timeInterval)
        let lapLabel = createLapLabel()
        createArrangedView(label: label, lap: lapLabel)
    }

    private func createLabelResult(timeInterval: TimeInterval) -> UILabel {
        let label = UILabel()
        label.text = timeInterval.stringFromTimeInterval()
        label.numberOfLines = 0
        label.text = "\(timeInterval.stringFromTimeInterval())"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .black
        label.frame.origin = .zero
        label.frame = CGRect(x: 0, y: 0, width: 95, height: 20)
        return label
    }

    private func createLapLabel() -> UILabel {
        let label = UILabel()
        currentLap += 1
        label.text = "LAP \(currentLap)"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .black
        label.frame.origin = .zero
        label.frame = CGRect(x: 0, y: 0, width: 95, height: 20)
        return label
    }

    private func createArrangedView(label: UILabel, lap: UILabel) {
        let timerView = UIView()
        timerView.frame = CGRect(x: 0, y: 0, width: label.frame.width * 4, height: label.frame.height * 5)
        timerView.backgroundColor = .white
        timerView.layer.cornerRadius = 25
        timerView.addSubview(label)
        label.frame = CGRect(x: 110, y: 60, width: 200, height: 40)
        timerView.addSubview(lap)
        lap.frame = CGRect(x: 130, y: 10, width: 200, height: 40)
        arrangedViewsView.addArrangedView(timerView)
    }

    @objc private func updateTimer() {
        currentTimeInterval += 1
        updateTimerLabel()
    }
}



