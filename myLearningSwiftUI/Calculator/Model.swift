//
//  Model.swift
//  myLearningSwiftUI
//
//  Created by Julian González on 14/01/22.
//

import Foundation
import SwiftUI

struct keyboardButton {
    let title: String
    let textColor: Color
    let backgroundColor: Color
    let isDoubleWidth: Bool
    let type: ButtonType
}

enum ButtonType {
    case number(Int)
    case operation(OperationType)
    case result
    case reset
}

enum OperationType {
    case sum
    case rest
    case multiplication
    case division
}
