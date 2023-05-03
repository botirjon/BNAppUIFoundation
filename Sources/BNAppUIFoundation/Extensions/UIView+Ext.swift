//
//  UIView+Ext.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 16/02/22.
//

import UIKit
import SnapKit


public extension UIView {
    func constraintToSuperviewEdges(with insets: UIEdgeInsets = .zero) {
        self.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(insets.left)
            make.right.equalToSuperview().offset(-insets.right)
            make.top.equalToSuperview().offset(insets.top)
            make.bottom.equalToSuperview().offset(-insets.bottom)
        }
    }
    
    @discardableResult
    func roundCorners(_ corners: UIRectCorner, radius: CGSize) -> CALayer {
        let maskedPath = UIBezierPath.init(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: radius)
        let shape = CAShapeLayer.init()
        shape.path = maskedPath.cgPath
        layer.mask = shape
        return shape
    }
    
    func roundTopCorners(by radius: CGSize) {
        roundCorners([.topLeft, .topRight], radius: radius)
    }
    
    func roundBottomCorners(by radius: CGSize) {
        roundCorners([.bottomLeft, .bottomRight], radius: radius)
    }
    
    @discardableResult
    func addBorder(on edge: UIRectEdge, color: UIColor, thickness: CGFloat = 1.0) -> CALayer {
        return layer.addBorder(on: edge, color: color, thickness: thickness)
    }
    
    func addBorder(side: CALayer.BorderSide, thickness: CGFloat, color: UIColor, maskedCorners: CACornerMask? = nil) {
        layer.addBorder(side: side, thickness: thickness, color: color.cgColor, maskedCorners: maskedCorners)
    }
    
    func dropShadow(_ x: CGFloat, _ y: CGFloat, _ blur: CGFloat, _ color: UIColor?, _ alpha: Float, spread: CGFloat = 0) {
        layer.shadowColor = color?.cgColor
        layer.shadowOpacity = alpha
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = blur/2
        let rect = bounds.insetBy(dx: -spread, dy: -spread)
        layer.shadowPath = (spread > 0) ? UIBezierPath(rect: rect).cgPath : nil
    }
    
    func dropShadow(_ x: CGFloat, _ y: CGFloat, _ blur: CGFloat, _ color: UIColor?, _ opacity: Float, spread: CGFloat = 0, cornerRadius: CGFloat, fillColor: UIColor = .white) {
        let shadowLayer = CAShapeLayer()
        let rect = bounds.insetBy(dx: -spread, dy: -spread)
        shadowLayer.path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = fillColor.cgColor
        shadowLayer.shadowColor = color?.cgColor
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowOffset = CGSize(width: x, height: y)
        shadowLayer.shadowRadius = blur/2
        layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func showShadow(_ alpha: Float = 0.3) {
        layer.shadowOpacity = alpha
    }
    
    func hideShadow() {
        layer.shadowOpacity = 0.0
    }
}


public extension UIEdgeInsets {
    var verticalSum: CGFloat {
        return self.top + self.bottom
    }
    
    var horizontalSum: CGFloat {
        return self.left + self.right
    }
}


public extension UINavigationItem {
    
    func setRightBarButtonItem(_ item: UIBarButtonItem) {
        let space = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
//        space.width = BoxMetrics.SafeArea.horizontal - 8
        space.width = 20-8
        self.rightBarButtonItems = [space, item]
    }
    
    func setRightBarButtonItems(_ items: [UIBarButtonItem]) {
        let space = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
//        space.width = BoxMetrics.SafeArea.horizontal - 8
        space.width = 20-8
        var _items = [space]
        _items.append(contentsOf: items)
        self.rightBarButtonItems = _items
    }
}


public extension UIButton {
    func setImageTitleSpacing(_ spacing: CGFloat) {
        if #available(iOS 15.0, *) {
            var configuration = self.configuration ?? UIButton.Configuration.borderless()
            configuration.imagePadding = spacing
            self.configuration = configuration
        } else {
            let spacing = semanticContentAttribute == .forceRightToLeft ? -spacing : spacing
            imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -spacing/2, bottom: 0, right: 0)
            titleEdgeInsets = UIEdgeInsets.init(top: 0, left: spacing/2, bottom: 0, right: 0)
        }
    }
}
