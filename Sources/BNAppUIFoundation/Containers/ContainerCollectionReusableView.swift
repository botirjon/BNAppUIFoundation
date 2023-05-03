//
//  ContainerCollectionReusableView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 23/02/22.
//

import Foundation
import UIKit
import SnapKit

public class ContainerCollectionReusableView<View: UIView>: UICollectionReusableView, AnyContainerView {
    
    public var viewLayout: ViewLayout<View> = .constrainedToEdges {
        didSet {
            updateViewLayout()
        }
    }
    
    public var contentEdgeInsets: UIEdgeInsets = .zero {
        didSet {
            super.layoutMargins = contentEdgeInsets
            updateViewLayout()
        }
    }
    
    public internal(set) lazy var view: View = {
        let view = View.init()
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        _init()
    }
    
    private func _init() {
        addSubview(view)
        backgroundColor = .clear
        contentEdgeInsets = .zero
        updateViewLayout()
    }
}
