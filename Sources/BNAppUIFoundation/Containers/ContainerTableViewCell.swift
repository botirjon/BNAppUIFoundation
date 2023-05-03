//
//  ContainerTableViewCell.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 23/02/22.
//

import Foundation
import UIKit

import SnapKit

///
open class ContainerTableViewCell<View: UIView>: BaseTableViewCell, AnyContainerView {
    
    open var viewLayout: ViewLayout<View> = .constrainedToEdges {
        didSet {
            updateViewLayout()
        }
    }
    
    open var contentEdgeInsets: UIEdgeInsets  = .zero {
        didSet {
            super.layoutMargins = contentEdgeInsets
            updateViewLayout()
        }
    }
    
    open var shouldAnimateOnTouch: Bool = false
    
    open internal(set) lazy var view: View = {
        let view = View.init()
        return view
    }()
    
    open override func initCell() {
        contentView.addSubview(view)
        backgroundColor = .clear
        contentEdgeInsets = .zero
        updateViewLayout()
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        beginTouches()
    }
    
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        endTouches()
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        endTouches()
    }
    
    private func beginTouches() {
        if shouldAnimateOnTouch {
            UIView.animate(withDuration: 0.2) {
                self.view.transform = .init(scaleX: 1.2, y: 1.2)
            }
        }
    }
    
    private func endTouches() {
        if shouldAnimateOnTouch {
            UIView.animate(withDuration: 0.2) {
                self.view.transform = .identity
            }
        }
    }
}
