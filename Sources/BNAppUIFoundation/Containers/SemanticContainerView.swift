//
//  SemanticContainerView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 21/01/23.
//

import Foundation
import UIKit


open class SemanticContainerView<View: UIView>: BaseStackView {
    
//    public enum Status {
//        case success(message: String = "")
//        case warning(message: String = "")
//        case error(message: String = "")
//        case custom(message: String = "", messageColor: UIColor = .appTextTertiary, borderColor: UIColor = .clear)
//        case none
//
//        public var message: String {
//            switch self {
//            case .success(let message):
//                return message
//            case .warning(let message):
//                return message
//            case .error(let message):
//                return message
//            case .custom(let message, _, _):
//                return message
//            case .none:
//                return ""
//            }
//        }
//
//        var color: Color {
//            switch self {
//            case .success:
//                return .init(messageColor: .appGreen, borderColor: .appGreen)
//            case .warning:
//                return .init(messageColor: .appAccent, borderColor: .appAccent)
//            case .error:
//                return .init(messageColor: .appRed, borderColor: .appRed)
//            case .custom(_, let messageColor, let borderColor):
//                return .init(messageColor: messageColor, borderColor: borderColor)
//            case .none:
//                return .init(messageColor: .clear, borderColor: .clear)
//            }
//        }
//
//        struct Color {
//            var messageColor: UIColor
//            var borderColor: UIColor
//        }
//    }
    
    public typealias Status = SemanticStatus
    
    public var status: Status = .none {
        didSet {
            setup(for: status)
        }
    }
    
    public var cornerRadius: CGFloat {
        set {
            contentView.layer.cornerRadius = newValue
        }
        get {
            contentView.layer.cornerRadius
        }
    }
    
    open var contentView: UIView {
        _contentView
    }
    
    private lazy var _contentView: ContainerView<View> = {
        let view = ContainerView<View>()
        view.layer.cornerRadius = view.view.layer.cornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var view: View {
        _contentView.view
    }
    
    open private(set) lazy var messageLabel: UILabel = {
        let label = ContentHuggingLabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = .gilroyFont(ofSize: 12)
        return label
    }()
    
    
    open override func initView() {
        super.initView()
        self.axis = .vertical
        self.distribution = .fill
        self.alignment = .center
        self.spacing = .scaling(8, along: .y)
        self.addArrangedSubview(_contentView)
        _contentView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        setup(for: status)
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
        view == _contentView || view == messageLabel
    }
    
    private func setup(for status: Status) {
        messageLabel.textColor = status.color.messageColor
        messageLabel.text = status.message
        _contentView.layer.borderWidth = 1
        _contentView.layer.borderColor = status.color.borderColor.cgColor
        
        if status.message.isEmpty {
            messageLabel.removeFromSuperview()
        } else if !self.arrangedSubviews.contains(messageLabel) {
            self.addArrangedSubview(messageLabel)
            messageLabel.snp.remakeConstraints { make in
                make.width.equalToSuperview()
            }
        }
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            setup(for: status)
        }
    }
}
