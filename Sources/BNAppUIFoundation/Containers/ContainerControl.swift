//
//  ContainerControl.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 30/03/22.
//

import UIKit

open class ContainerControl<View: UIView>: BaseControl, AnyContainerView {
    
    public internal(set) lazy var view: View = {
        let view = View()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    open var viewLayout: ViewLayout<View> = .constrainedToEdges {
        didSet {
            updateViewLayout()
        }
    }
    
    /// Layout insets to inset the `view`.
    public var contentEdgeInsets: UIEdgeInsets  = .zero {
        didSet {
            updateViewLayout()
        }
    }
    
    open var addingExternalSubviewsEnabled: Bool {
        false
    }
    
    open override func addSubview(_ view: UIView) {
        if addingExternalSubviewsEnabled {
            super.addSubview(view)
        } else {
            guard view == self.view else {
                return
            }
            super.addSubview(view)
        }
    }
    
    open override func initControl() {
        super.initControl()
        addSubview(view)
        backgroundColor = .clear
        contentEdgeInsets = .zero
        updateViewLayout()
    }
}

