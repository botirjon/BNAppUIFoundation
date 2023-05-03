//
//  BaseTableHeaderFooterView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 23/02/22.
//

import Foundation
import UIKit

open class BaseTableHeaderFooterView: UITableViewHeaderFooterView, CustomTaggable {
    
    public var customTag: Any?
    
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        _initView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        _initView()
    }
    
    private func _initView() {
        initView()
        addSubviews()
        addConstraints()
    }
    
    open func initView() {
        
    }
    
    open func addSubviews() {
        
    }
    
    open func addConstraints() {
        
    }
}
