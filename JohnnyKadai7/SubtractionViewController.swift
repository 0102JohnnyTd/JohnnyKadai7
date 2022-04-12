//
//  SubtractionViewController.swift
//  JohnnyKadai7
//
//  Created by Johnny Toda on 2022/04/05.
//

import UIKit

private enum UnderflowErrorMessage {
    static let valueIsTooSmall = "値が大きすぎるため扱うことができません"
    static let unknownError = "不明のエラーです"
}

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

    private func reportingUnderflowWithError(_ result: Int) throws -> Int {
        guard !(result < Int.min) else {
            throw UnderflowError()
        }
        return result
    }

    private func calculateSubtractionResult() {
        do {
            let values = valueTextFields.map { $0.textToInt }
            let result = try reportingUnderflowWithError(values[0] - values[1])
            resultLabel.text = result.description
        } catch is UnderflowError {
                resultLabel.text = UnderflowErrorMessage.valueIsTooSmall
        } catch {
                resultLabel.text = UnderflowErrorMessage.unknownError
            }
        }
}
