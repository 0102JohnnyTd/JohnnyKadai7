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
        fetchSubtractionResult()
        view.endEditing(true)
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

    private func reportingUnderflowWithError(_ result: Int) throws -> Int {
        guard !(result < Int.min) else {
            throw UnderflowError()
        }
        return result
    }

    private func fetchSubtractionResult() {
        do {
            let values = textfields.map { $0.textToInt }
            let result = try reportingUnderflowWithError(values[0] - values[1])
            resultLabel.text = result.description
        } catch {
            switch error {
            case is UnderflowError:
                resultLabel.text = "値が小さすぎるため扱うことができません"
            default:
                resultLabel.text = "不明のエラーです"
            }
        }
    }
}
