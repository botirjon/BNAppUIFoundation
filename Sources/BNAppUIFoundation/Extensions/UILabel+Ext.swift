//
//  UILabel+Ext.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 25/02/22.
//

import UIKit


public extension UILabel {
    
    func setText(_ text: AppText?) {
        guard let unwrappedText = text else {
            self.text = nil
            self.attributedText = nil
            return
        }
        switch unwrappedText {
        case .plain(let value):
            self.text = value
        case .attributed(let value):
            self.attributedText = value
        }
    }
    
    var textResource: AppText? { // unifiedText?
        if attributedText != nil {
            return .attributed(attributedText)
        } else if text != nil {
            return .plain(text)
        } else {
            return nil
        }
    }
}
