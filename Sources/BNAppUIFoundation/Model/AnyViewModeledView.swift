//
//  AnyViewModeledView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 14/06/22.
//

import Foundation
import UIKit

public protocol AnyViewModeledView: UIView {
    associatedtype ViewModel
    
    var viewModel: ViewModel? { get set }
    func bind(viewModel: ViewModel?)
    
}
