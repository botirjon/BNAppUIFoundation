//
//  AccessoryContainerView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 09/03/22.
//

import UIKit
import SnapKit


open class AccessoryContainerView<View: UIView, AccessoryView: UIView>: BaseStackView {
    
    public internal(set) lazy var view: View = {
        let view = View()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public internal(set) lazy var accessoryView: AccessoryView = {
        let accessoryView = AccessoryView()
        accessoryView.translatesAutoresizingMaskIntoConstraints = false
        return accessoryView
    }()
    
    var stackView: UIStackView { self }
    
    private lazy var flexView: UILabel = {
        let flexView = UILabel()
        flexView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        flexView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return flexView
    }()
    
    public var shouldFlex: Bool = true {
        didSet {
            updateArrangement()
        }
    }
    
    public enum AccessoryPosition {
        case left
        case right
    }
    
    open var accessoryPosition: AccessoryPosition = .right {
        didSet {
            if oldValue != accessoryPosition {
                updateArrangement()
            }
        }
    }
    
    open override func initView() {
        super.initView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        updateArrangement()
    }
    
    func updateArrangement() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        switch  accessoryPosition {
        case .left:
            stackView.addArrangedSubview(accessoryView)
            stackView.addArrangedSubview(view)
            
        case .right:
            stackView.addArrangedSubview(view)
            if shouldFlex {
                stackView.addArrangedSubview(flexView)
            }
            stackView.addArrangedSubview(accessoryView)
        }
    }
}
