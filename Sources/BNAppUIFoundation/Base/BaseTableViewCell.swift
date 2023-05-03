//
//  BaseTableViewCell.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 14/06/22.
//

import UIKit

open class BaseTableViewCell: UITableViewCell, CustomTaggable {
    
    public var customTag: Any?
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCell()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        initCell()
    }
    
    
    open func initCell() {
        
    }
    
    open func setupTargets() {
        
    }
}
