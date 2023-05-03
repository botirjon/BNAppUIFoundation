//
//  AnyButtonAction.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 22/02/23.
//

import Foundation
import UIKit

public protocol AnyButtonAction {
    var title: String { get }
    var style: Button.Style { get }
    var handler: (() -> Void)? { get }
}


public struct ButtonAction: AnyButtonAction {
    public var title: String
    public var style: Button.Style
    public var handler: (() -> Void)?
    
    public init(title: String, style: Button.Style = .filled, handler: (() -> Void)? = nil) {
        self.title = title
        self.style = style
        self.handler = handler
    }
}
