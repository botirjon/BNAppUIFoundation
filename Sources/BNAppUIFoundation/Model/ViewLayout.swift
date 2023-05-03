//
//  ViewLayout.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 19/01/23.
//

import UIKit

public enum ViewLayout<View> {
    case constrainedToEdges
    case centered
    
    case leading(verticalPosition: ViewPosition)
    case trailing(verticalPosition: ViewPosition)
    case hCenter(verticalPosition: ViewPosition)
    
    case top(horizontalPosition: ViewPosition)
    case bottom(horizontalPosition: ViewPosition)
    case vCenter(horizontalPosition: ViewPosition)
    
    
    case custom((_ view: View, _ layoutMargins: UIEdgeInsets) -> Void)
}

public enum ViewPosition {
    case edgeToEdge
    case start
    case middle
    case end
}

