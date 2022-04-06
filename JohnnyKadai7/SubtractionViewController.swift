//
//  SubtractionViewController.swift
//  JohnnyKadai7
//
//  Created by Johnny Toda on 2022/04/05.
//

import UIKit

final class SubtractionViewController: UIViewController {
    @IBOutlet private weak var firstTextField: UITextField!

    @IBOutlet private weak var secondTextField: UITextField!

    @IBAction private func executeCalculation(_ sender: Any) {
    }

    @IBOutlet private weak var resultLabel: UILabel!

    private var textfields: [UITextField] {
        [firstTextField,secondTextField]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpKeyboard()
    }
    private func setUpKeyboard() {
        textfields.forEach{ $0.keyboardType = .numberPad }
    }
}
