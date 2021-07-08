//
//  ViewController.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

final class BookReaderViewController: UIViewController {



    //MARK: - Private properties
    private let bookReaderView = BookReaderView()

    //MARK: - UIViewController

    override func loadView() {
        self.view = bookReaderView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bookReaderView.delegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        resignFirstResponder()
    }
}

//MARK: - BookReaderViewDelegate

extension BookReaderViewController: BookReaderViewDelegate {

    func openShareController(sharingItems: [String]) {
        let shareController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
        present(shareController, animated: true)
    }
}
