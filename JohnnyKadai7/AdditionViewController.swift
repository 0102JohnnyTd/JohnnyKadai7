//
//  AdditionViewController.swift
//  JohnnyKadai7
//
//  Created by Johnny Toda on 2022/04/05.
//

import UIKit

private enum OverflowErrorMessage {
    static let valueIsTooLarge = "値が大きすぎるため扱うことができません"
    static let unknownError = "不明のエラーです"
}

final class AdditionViewController: UIViewController {
    @IBOutlet private var valueTextFields: [UITextField] = []

    @IBAction private func executeCalculation(_ sender: Any) {
        calculateAdditionResult()
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

    private func calculateAdditionResult() {
        do {
            let values = valueTextFields.map { $0.textToInt }
            let result = try values.reduce(0) { try $0.addingReportingOverflowWithError($1) }
            resultLabel.text = result.description
        } catch is OverflowError {
            resultLabel.text = OverflowErrorMessage.valueIsTooLarge
        } catch {
            resultLabel.text = OverflowErrorMessage.unknownError
        }
    }
}

private extension Int {
    func addingReportingOverflowWithError(_ other: Int) throws -> Int {
        let result = addingReportingOverflow(other)
        guard !result.overflow else {
           throw OverflowError()
        }
        return result.partialValue
    }
}
