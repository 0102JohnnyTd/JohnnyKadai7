//
//  UITextField+Extension.swift
//  JohnnyKadai7
//
//  Created by akio0911 on 2022/04/11.
//

import UIKit

extension UITextField {
    var textToInt: Int {
       text.flatMap { Int($0) } ?? 0
    }
}
