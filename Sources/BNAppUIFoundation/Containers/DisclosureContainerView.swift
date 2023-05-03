//
//  DisclosureContainerView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 03/02/23.
//

import Foundation
import UIKit



public class DisclosureContainerControl<View: UIView>: ContainerControl<DisclosureContainerView<View>> {
    
    public var shouldFlex: Bool {
        set {
            view.shouldFlex = newValue
        }
        get {
            view.shouldFlex
        }
    }
    
    public var mainView: View {
        view.view
    }
    
    public var accessoryView: UIButton {
        view.accessoryView
    }
    
    public override func initControl() {
        super.initControl()
        layer.cornerRadius = BoxMetrics.cornerRadius12
        backgroundColor = .appBackgroundSecondary
        contentEdgeInsets = .init(y: 0, x: .horizontal(scaling: 15))
    }
    
    public override var intrinsicContentSize: CGSize {
        .init(width: super.intrinsicContentSize.width, height: .height(scaling: 46))
    }
}


public class DisclosureContainerView<View: UIView>: AccessoryContainerView<View, UIButton> {
    
    public override func initView() {
        super.initView()
        accessoryView.snp.makeConstraints { make in
            make.size.equalTo(CGSize.squareSize(of: .height(scaling: 16)))
        }
        let bundle = Bundle(for: DisclosureContainerView<View>.self)
        let image = UIImage(named: "img.chevron.right", in: bundle, compatibleWith: nil)
        accessoryView.setImage(image, for: .normal)
    }
}

