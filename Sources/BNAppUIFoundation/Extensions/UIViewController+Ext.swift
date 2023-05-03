//
//  UIViewController+Ext.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 17/02/22.
//

import Foundation
import UIKit


public extension UIViewController {
    var isVisible: Bool {
        return self.viewIfLoaded?.window != nil
    }
}
