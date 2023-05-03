//
//  BaseView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 11/12/20.
//

import Foundation
import UIKit

open class BaseView: UIView, CustomTaggable {
    public var customTag: Any?
    
    private var corners: UIRectCorner?
    private var cornerRadii: CGSize?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        _initView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        _initView()
    }
    
    private func _initView() {
        initView()
    }
    
    open func initView() {
        
    }
    
    open func updateTheme() {
        
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        if let corners = corners, let cornerRadii = self.cornerRadii {
            self.roundCorners(corners, radius: cornerRadii)
        }
    }
    
    open func setCornerRadii(_ cornerRadii: CGSize?, forCorners corners: UIRectCorner?) {
        self.cornerRadii = cornerRadii
        self.corners = corners
    }
}



