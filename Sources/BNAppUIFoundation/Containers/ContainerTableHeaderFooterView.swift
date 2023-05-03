//
//  ContainerTableHeaderFooterView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 23/02/22.
//

import UIKit

open class ContainerTableHeaderFooterView<View: UIView>: BaseTableHeaderFooterView, AnyContainerView {
    
    open var viewLayout: ViewLayout<View> = .constrainedToEdges {
        didSet {
            updateViewLayout()
        }
    }
    
    public internal(set) lazy var view: View = {
        let view = View()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        backgroundColor = .white
        contentEdgeInsets = .zero
        addSubview(view)
        updateViewLayout()
    }
}
