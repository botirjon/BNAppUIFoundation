//
//  BaseStackView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 19/08/22.
//

import Foundation
import UIKit

open class BaseStackView: UIStackView, CustomTaggable {
    
    public var customTag: Any?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        _initView()
    }
    
    public required init(coder: NSCoder) {
        super.init(coder: coder)
        _initView()
    }
    
    private func _initView() {
        initView()
    }
    
    open func initView() {
        
    }
}
