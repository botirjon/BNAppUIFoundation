//
//  BaseControl.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 11/12/20.
//

import Foundation
import UIKit

open class BaseControl: UIControl, CustomTaggable {
    
    public var customTag: Any?
    
    private var corners: UIRectCorner?
    private var cornerRadii: CGSize?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        _init()
    }
    
    private func _init() {
        initControl()
    }
    
    open func initControl() {
        
    }
    
    open func updateTheme() {
        
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        if let corners = corners, let cornerRadii = self.cornerRadii {
            self.roundCorners(corners, radius: cornerRadii)
        }
    }
    
    open func setCornerRadii(_ cornerRadii: CGSize, forCorners corners: UIRectCorner?) {
        self.cornerRadii = cornerRadii
        self.corners = corners
    }
}
