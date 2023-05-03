//
//  UIEdgeInsets+Ext.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 04/04/22.
//

import UIKit


public extension UITableViewCell {
    static var hiddenSeparatorInset: UIEdgeInsets {
        return UIEdgeInsets.tableViewCellHiddenSeparatorInset
    }
}

public extension UIEdgeInsets {
    
    static var tableViewCellHiddenSeparatorInset: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: UIScreen.main.bounds.size.width, bottom: 0, right: 0)
    }
}
