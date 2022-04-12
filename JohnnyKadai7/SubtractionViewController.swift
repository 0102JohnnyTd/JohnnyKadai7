//
//  SubtractionViewController.swift
//  JohnnyKadai7
//
//  Created by Johnny Toda on 2022/04/05.
//

import UIKit

final class SubtractionViewController: UIViewController {
    @IBOutlet private var valueTextFields: [UITextField] = []

    @IBAction private func executeCalculation(_ sender: Any) {
        calculateSubtractionResult()
        view.endEditing(true)
    }

    @IBOutlet private weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpKeyboard()
    }

    private func setUpKeyboard() {
        valueTextFields.forEach { $0.keyboardType = .numberPad }
    }

    private func calculateSubtractionResult() {
        let values = valueTextFields.map { $0.textToInt }
        let result = values[0] - values[1]
        resultLabel.text = result.description
    }
}
