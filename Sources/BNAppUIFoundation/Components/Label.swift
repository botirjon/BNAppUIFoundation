//
//  File.swift
//  
//
//  Created by Botirjon Nasridinov on 03/05/23.
//

import Foundation
import UIKit

/// A label that always hugs content in horizontal direction
public class HorizontallyContentHuggingLabel: UILabel {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        _initView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        _initView()
    }
    
    private func _initView() {
        setContentHuggingPriority(.required, for: .horizontal)
    }
}


/// A label that always hugs content in vertical direction
public class VerticallyContentHuggingLabel: UILabel {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        _initView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        _initView()
    }
    
    private func _initView() {
        setContentHuggingPriority(.required, for: .vertical)
    }
}

public class ContentHuggingLabel: UILabel {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        _initView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        _initView()
    }
    
    private func _initView() {
        setContentHuggingPriority(.required, for: .vertical)
        setContentHuggingPriority(.required, for: .horizontal)
    }
}

