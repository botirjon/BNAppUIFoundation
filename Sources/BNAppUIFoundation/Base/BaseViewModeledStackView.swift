//
//  BaseViewModeledStackView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 19/08/22.
//

import UIKit

open class BaseViewModeledStackView<ViewModel>: BaseStackView {
    
    public convenience init(viewModel: ViewModel?) {
        self.init(frame: .zero)
        self.viewModel = viewModel
        self.bind(viewModel: viewModel)
    }
    
    open var viewModel: ViewModel? {
        didSet {
            self.bind(viewModel: viewModel)
        }
    }
    
    open func bind(viewModel: ViewModel?) {
    }
}


