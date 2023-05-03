//
//  ContainerView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 23/02/22.
//

import UIKit
import SnapKit

open class ContainerView<View: UIView>: BaseView, AnyContainerView {

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
    
    open override func addSubview(_ view: UIView) {
        guard view == self.view else {
            return
        }
        super.addSubview(view)
    }
    
    open override func initView() {
        super.initView()
        addSubview(view)
        backgroundColor = .clear
        contentEdgeInsets = .zero
        updateViewLayout()
    }
}
