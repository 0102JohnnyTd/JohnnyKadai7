//
//  AdditionViewController.swift
//  JohnnyKadai7
//
//  Created by Johnny Toda on 2022/04/05.
//

import UIKit

final class AdditionViewController: UIViewController {
    @IBOutlet private weak var firstTextField: UITextField!

    @IBOutlet private weak var secondTextField: UITextField!

    @IBAction private func executeCalculation(_ sender: Any) {
        additionValue()
        view.endEditing(true)
    }

    @IBOutlet private weak var resultLabel: UILabel!

    private var textFields: [UITextField] {
        [firstTextField,secondTextField]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpKeyboard()
    }

    private func setUpKeyboard() {
        textFields.forEach { $0.keyboardType = .numberPad }
    }

    private func additionValue() {
        do {
            let values = textFields.map{ $0.textToInt }
            let sum = try values.reduce(0) { try $0.addingReportingOverflowWithError($1) }
            resultLabel.text = sum.description
        } catch {
            switch error {
            case is OverflowError:
                resultLabel.text = "値が大きすぎるため扱うことができません"
            default:
                resultLabel.text = "不明のエラーです"
            }
        }
    }
}

extension UITextField {
    var textToInt: Int {
       text.flatMap { Int($0) } ?? 0
    }
}

struct OverflowError: Error {}

private extension Int {
    func addingReportingOverflowWithError(_ other: Int) throws -> Int {
        let result = addingReportingOverflow(other)
        guard !result.overflow else {
           throw OverflowError()
        }
        return result.partialValue
    }
}
