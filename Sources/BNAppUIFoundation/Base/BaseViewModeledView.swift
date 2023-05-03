//
//  BaseViewModeledView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 23/02/22.
//

import UIKit

open class BaseViewModeledView<ViewModel>: BaseView {
    
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

