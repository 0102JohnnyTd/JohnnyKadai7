//
//  UITextField +.swift
//  JohnnyKadai7
//
//  Created by Johnny Toda on 2022/04/13.
//

import UIKit

extension UITextField {
    var textToInt: Int {
       text.flatMap { Int($0) } ?? 0
    }
}
