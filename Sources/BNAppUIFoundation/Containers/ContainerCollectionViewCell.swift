//
//  ContainerCollectionViewCell.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 23/02/22.
//

import Foundation
import UIKit
import SnapKit

open class ContainerCollectionViewCell<View: UIView>: UICollectionViewCell, AnyContainerView {
    
    public var shouldAnimateOnTouch: Bool = false
    
    public internal(set) lazy var view: View = {
        let view = View()
        return view
    }()
    
    open var viewLayout: ViewLayout<View> = .constrainedToEdges {
        didSet {
            updateViewLayout()
        }
    }
    
    public var contentEdgeInsets: UIEdgeInsets = .zero {
        didSet {
            updateViewLayout()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        _init()
    }
    
    private func _init() {
//        contentView.addSubview(view)
//        backgroundColor = .clear
//        contentEdgeInsets = .zero
//        updateViewLayout()
        initCell()
    }
    
    open func initCell() {
        contentView.addSubview(view)
        backgroundColor = .clear
        contentEdgeInsets = .zero
        updateViewLayout()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        beginTouches()
        super.touchesBegan(touches, with: event)
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        endTouches()
        super.touchesEnded(touches, with: event)
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        endTouches()
        super.touchesCancelled(touches, with: event)
    }
    
    private func beginTouches(completion: (() -> Void)? = nil) {
        if shouldAnimateOnTouch {
            UIView.animate(withDuration: 0.1, animations: {
                self.view.transform = .init(scaleX: 1.1, y: 1.1)
            }) { (_) in
                completion?()
            }
        } else { completion?() }
    }
    
    private func endTouches(completion: (() -> Void)? = nil) {
        if shouldAnimateOnTouch {
            UIView.animate(withDuration: 0.1, animations: {
                self.view.transform = .identity
            }) { (_) in
                completion?()
            }
        } else { completion?() }
    }
}
