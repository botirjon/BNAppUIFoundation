//
//  RoundedContainerView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 23/02/22.
//

import Foundation
import UIKit


open class RoundedContainerView<View: UIView>: ContainerView<View> {
    
    open var cornerRadius: CGFloat = 10 {
        didSet { updateCornerRadius() }
    }
    
    open override func initView() {
        super.initView()
        clipsToBounds = true
        updateCornerRadius()
    }
    
    private func updateCornerRadius() {
        layer.cornerRadius = cornerRadius
    }
}
