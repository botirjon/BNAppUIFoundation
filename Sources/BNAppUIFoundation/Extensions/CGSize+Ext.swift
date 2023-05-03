//
//  CGSize+Ext.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 22/02/22.
//

import UIKit


public extension CGSize {
    
    static func squareSize(of size: CGFloat) -> CGSize {
        return CGSize.init(width: size, height: size)
    }
    
}
