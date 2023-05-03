//
//  LabeledContainerView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 22/01/23.
//

import UIKit


open class LabeledContainerControl<View: UIView>: ContainerControl<LabeledContainerView<View>> {
    
    public var contentView: View {
        return view.view
    }
    
    open var label: String? {
        set {
            view.label = newValue
        }
        get {
            view.label
        }
    }
    
    open var cornerRadius: CGFloat {
        set {
            view.cornerRadius = newValue
        }
        get {
            view.cornerRadius
        }
    }
    
    open var spacing: CGFloat {
        set {
            view.spacing = newValue
        }
        get {
            view.spacing
        }
    }
}

open class LabeledContainerView<View: UIView>: BaseStackView {
    
    public var label: String? {
        didSet {
            setup(for: label)
        }
    }
    
    public var cornerRadius: CGFloat {
        set {
            view.layer.cornerRadius = newValue
        }
        get {
            view.layer.cornerRadius
        }
    }
    
    public private(set) lazy var view: View = {
        let view = View()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    open private(set) lazy var headerLabel: UILabel = {
        let label = ContentHuggingLabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    open override func initView() {
        super.initView()
        self.axis = .vertical
        self.distribution = .fill
        self.alignment = .center
        self.spacing = 6
        self.addArrangedSubview(view)
        view.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        setup(for: self.label)
    }
    
    open override func addArrangedSubview(_ view: UIView) {
        if canContainView(view) {
            super.addArrangedSubview(view)
        }
    }
    
    open override func insertArrangedSubview(_ view: UIView, at stackIndex: Int) {
        if canContainView(view) {
            super.insertArrangedSubview(view, at: stackIndex)
        }
    }
    
    private func canContainView(_ view: UIView) -> Bool {
        view == self.view || view == headerLabel
    }
    
    private func setup(for label: String?) {
        let text = label ?? ""
        headerLabel.text = text
        if text.isEmpty {
            headerLabel.removeFromSuperview()
        } else if !self.arrangedSubviews.contains(headerLabel) {
            self.insertArrangedSubview(headerLabel, at: 0)
            headerLabel.snp.remakeConstraints { make in
                make.width.equalToSuperview()
            }
        }
    }
}

