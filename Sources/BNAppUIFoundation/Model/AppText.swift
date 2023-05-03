//
//  AppText.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 25/02/22.
//

import Foundation
import UIKit
import BNAppFoundation

public enum AppText {
    case plain(String?)
    case attributed(NSAttributedString?)
    
    public var plainValue: String? {
        switch self {
        case .plain(let value):
            return value
        case .attributed(let value):
            return value?.string
        }
    }
    
    public var isEmpty: Bool {
        switch self {
        case .plain(let value):
            return (value ?? "").isEmpty
        case .attributed(let value):
            if let val = value {
                return val.string.isEmpty
            }
            return true
        }
    }
}

public extension AppText {
    func height(withConstrainedWidth width: CGFloat, font: UIFont? = nil) -> CGFloat {
        switch self {
        case .plain(let value):
            return value?.height(withConstrainedWidth: width, font: font!) ?? 0
        case .attributed(let value):
            return value?.height(withConstrainedWidth: width) ?? 0
        }
    }
    
    func  width(withConstrainedHeight height: CGFloat, font: UIFont? = nil) -> CGFloat {
        switch self {
        case .plain(let value):
            return value?.width(withConstrainedHeight: height, font: font!) ?? 0
        case .attributed(let value):
            return value?.width(withConstrainedHeight: height) ?? 0
        }
    }
}
