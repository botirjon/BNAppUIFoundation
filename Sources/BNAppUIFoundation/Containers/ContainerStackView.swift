//
//  ContainerStackView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 26/12/22.
//

import Foundation
import UIKit

open class ContainerStackView: BaseView, AnyContainerView {
    
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    
    internal var view: UIStackView {
        stackView
    }
    
    open var viewLayout: ViewLayout<UIStackView> = .constrainedToEdges {
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
        guard view == self.stackView else {
            return
        }
        super.addSubview(view)
    }
    
    open override func initView() {
        super.initView()
        addSubview(stackView)
        backgroundColor = .clear
        contentEdgeInsets = .zero
        updateViewLayout()
    }
    
    
    open var arrangedSubviews: [UIView] { stackView.arrangedSubviews }
    
    
    
    open func addArrangedSubview(_ view: UIView) {
        stackView.addArrangedSubview(view)
    }
    
    
    open func removeArrangedSubview(_ view: UIView) {
        stackView.removeArrangedSubview(view)
    }
    
    open func insertArrangedSubview(_ view: UIView, at stackIndex: Int) {
        stackView.insertArrangedSubview(view, at: stackIndex)
    }
    
    open var axis: NSLayoutConstraint.Axis {
        set {
            stackView.axis = newValue
        }
        get {
            stackView.axis
        }
    }
    
    
    /* The layout of the arrangedSubviews along the axis
     */
    open var distribution: UIStackView.Distribution {
        set {
            stackView.distribution = newValue
        }
        get {
            stackView.distribution
        }
    }
    
    
    /* The layout of the arrangedSubviews transverse to the axis;
     e.g., leading/trailing edges in a vertical stack
     */
    open var alignment: UIStackView.Alignment {
        set {
            stackView.alignment = newValue
        }
        get {
            stackView.alignment
        }
    }
    
    
    /* Spacing between adjacent edges of arrangedSubviews.
     Used as a strict spacing for the Fill distributions, and
     as a minimum spacing for the EqualCentering and EqualSpacing
     distributions. Use negative values to allow overlap.
     
     On iOS 11.0 or later, use UIStackViewSpacingUseSystem (Swift: UIStackView.spacingUseSystem)
     to get a system standard spacing value. Setting spacing to UIStackViewSpacingUseDefault
     (Swift: UIStackView.spacingUseDefault) will result in a spacing of 0.
     
     System spacing between views depends on the views involved, and may vary across the
     stack view.
     
     In vertical stack views with baselineRelativeArrangement == YES, the spacing between
     text-containing views (such as UILabels) will depend on the fonts involved.
     */
    open var spacing: CGFloat {
        set {
            stackView.spacing = newValue
        }
        get {
            stackView.spacing
        }
    }
    
    
    /* Set and get custom spacing after a view.
     
     This custom spacing takes precedence over any other value that might otherwise be used
     for the space following the arranged subview.
     
     Defaults to UIStackViewSpacingUseDefault (Swift: UIStackView.spacingUseDefault), where
     resolved value will match the spacing property.
     
     You may also set the custom spacing to UIStackViewSpacingUseSystem (Swift: UIStackView.spacingUseSystem),
     where the resolved value will match the system-defined value for the space to the neighboring view,
     independent of the spacing property.
     
     Maintained when the arranged subview changes position in the stack view, but not after it
     is removed from the arrangedSubviews list.
     
     Ignored if arrangedSubview is not actually an arranged subview.
     */
    @available(iOS 11.0, *)
    open func setCustomSpacing(_ spacing: CGFloat, after arrangedSubview: UIView) {
        stackView.setCustomSpacing(spacing, after: arrangedSubview)
    }
    
    @available(iOS 11.0, *)
    open func customSpacing(after arrangedSubview: UIView) -> CGFloat {
        stackView.customSpacing(after: arrangedSubview)
    }
    
    
    /* Baseline-to-baseline spacing in vertical stacks.
     The baselineRelativeArrangement property supports specifications of vertical
     space from the last baseline of one text-based view to the first baseline of a
     text-based view below, or from the  top (or bottom) of a container to the first
     (or last) baseline of a contained text-based view.
     This property is ignored in horizontal stacks. Use the alignment property
     to specify baseline alignment in horizontal stacks.
     Defaults to NO.
     */
    open var isBaselineRelativeArrangement: Bool {
        set {
            stackView.isBaselineRelativeArrangement = newValue
        }
        get {
            stackView.isBaselineRelativeArrangement
        }
    }
    
    
    /* Uses margin layout attributes for edge constraints where applicable.
     Defaults to NO.
     */
    open var isLayoutMarginsRelativeArrangement: Bool {
        set {
            stackView.isLayoutMarginsRelativeArrangement = newValue
        }
        get {
            stackView.isLayoutMarginsRelativeArrangement
        }
    }
}
