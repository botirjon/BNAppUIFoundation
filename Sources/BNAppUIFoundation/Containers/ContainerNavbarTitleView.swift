//
//  ContainerNavbarTitleView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 02/02/23.
//

import Foundation
import UIKit


public final class ContainerNavbarTitleView<View: UIView>: ContainerView<View> {
    
    public var width: CGFloat = UIScreen.main.bounds.size.width {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    public var height: CGFloat = .height(scaling: 44) {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        .init(width: width, height: max(height, view.intrinsicContentSize.height))
    }
}
