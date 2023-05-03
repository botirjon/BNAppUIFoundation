//
//  ShadowContainerView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 15/02/23.
//

import Foundation
import UIKit


open class ShadowContainerView<View: UIView>: ContainerView<View> {
    
    struct Shadow {
        var color: CGColor? = UIColor.black.withAlphaComponent(0.1).cgColor
        var opacity: Float = 1
        var radius: CGFloat = 50
        var offset: CGSize = .zero
    }

    
    private lazy var shadowLayer: CALayer = {
        let shadowLayer = CALayer()
        return shadowLayer
    }()
    
    var shadow: Shadow {
        set {
            shadowColor = newValue.color
            shadowOpacity = newValue.opacity
            shadowRadius = newValue.radius
            shadowOffset = newValue.offset
        }
        get {
            .init(
                color: shadowColor,
                opacity: shadowOpacity,
                radius: shadowRadius,
                offset: shadowOffset
            )
        }
    }
    
    public var shadowColor: CGColor? {
        set {
            shadowLayer.shadowColor = newValue
        }
        get {
            shadowLayer.shadowColor
        }
    }
    
    public var shadowOpacity: Float {
        set {
            shadowLayer.shadowOpacity = newValue
        }
        get {
            shadowLayer.shadowOpacity
        }
    }
    
    public var shadowRadius: CGFloat {
        set {
            shadowLayer.shadowRadius = newValue
        }
        get {
            shadowLayer.shadowRadius
        }
    }
    
    public var shadowOffset: CGSize {
        set {
            shadowLayer.shadowOffset = newValue
        }
        get {
            shadowLayer.shadowOffset
        }
    }
    
    public convenience init(
        shadowColor: CGColor?,
        shadowOpacity: Float,
        shadowRadius: CGFloat,
        shadowOffset: CGSize
    ) {
        self.init()
        self.shadowColor = shadowColor
        self.shadowOpacity = shadowOpacity
        self.shadowRadius = shadowRadius
        self.shadowOffset = shadowOffset
    }
    
    open override func initView() {
        super.initView()
        self.shadow = .init()
        layer.insertSublayer(shadowLayer, at: 0)
        
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        shadowLayer.frame = bounds
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: shadowCorners(), cornerRadii: .init(width: layer.cornerRadius, height: layer.cornerRadius))
        shadowLayer.shadowPath = path.cgPath
    }
    
    private func shadowCorners() -> UIRectCorner {
        var corners: UIRectCorner = []
        let maskedCorners = layer.maskedCorners
        
        if maskedCorners.contains(.layerMinXMinYCorner) {
            corners.insert(.topLeft)
        }
        
        if maskedCorners.contains(.layerMaxXMinYCorner) {
            corners.insert(.topRight)
        }
        
        if maskedCorners.contains(.layerMaxXMaxYCorner) {
            corners.insert(.bottomRight)
        }
        
        if maskedCorners.contains(.layerMinXMaxYCorner) {
            corners.insert(.bottomLeft)
        }
        return corners
    }
}
