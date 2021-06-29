//
//  ViewControllerTwo.swift
//  UIKitHomeworks
//
//  Created by Vlad on 29.06.2021.
//

import UIKit

class ViewControllerTwo: UIViewController {
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var `switch`: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segment.selectedSegmentIndex = 1
        self.navigationItem.backButtonTitle = ""
        
    }
    
    func showShareWindow() {
        let items = ["Sharing"]
        let svc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        self.present(svc, animated: true, completion: nil)
    }

    @IBAction func switchChangeValue(_ sender: UISwitch) {
        if sender.isOn {
            showShareWindow()
        }
    }
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            showShareWindow()
        }
    }
}
