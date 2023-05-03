//
//  AnyContainerView.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 19/01/23.
//

import UIKit
import SnapKit

protocol AnyContainerView {
    associatedtype View: UIView
    
    var view: View { get }
    var viewLayout: ViewLayout<View> { get set }
    var contentEdgeInsets: UIEdgeInsets { get set }
    
    func updateViewLayout()
}


extension AnyContainerView {
    func updateViewLayout() {
        
        view.snp.removeConstraints()
        
        switch viewLayout {
        case .constrainedToEdges:
            view.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(contentEdgeInsets.left)
                make.bottom.equalToSuperview().offset(-contentEdgeInsets.bottom)
                make.right.equalToSuperview().offset(-contentEdgeInsets.right)
                make.top.equalToSuperview().offset(contentEdgeInsets.top)
            }
            
        case .centered:
            view.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
            
        case .leading(verticalPosition: let verticalPosition):
            view.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(contentEdgeInsets.left)
                self.verticallyConstrainView(constraintMaker: make, position: verticalPosition)
            }
        case .trailing(verticalPosition: let verticalPosition):
            view.snp.makeConstraints { make in
                make.right.equalToSuperview().offset(-contentEdgeInsets.right)
                self.verticallyConstrainView(constraintMaker: make, position: verticalPosition)
            }
        case .top(horizontalPosition: let horizontalPosition):
            view.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(contentEdgeInsets.top)
                self.horizontallyConstrainView(constraintMaker: make, position: horizontalPosition)
            }
        case .bottom(horizontalPosition: let horizontalPosition):
            view.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-contentEdgeInsets.bottom)
                self.horizontallyConstrainView(constraintMaker: make, position: horizontalPosition)
            }
            
        case .hCenter(verticalPosition: let verticalPosition):
            view.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                self.verticallyConstrainView(constraintMaker: make, position: verticalPosition)
            }
            
        case .vCenter(horizontalPosition: let horizontalPosition):
            view.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                self.horizontallyConstrainView(constraintMaker: make, position: horizontalPosition)
            }
            
        case .custom(let layoutView):
            layoutView(view, contentEdgeInsets)
        }
    }
    
    private func verticallyConstrainView(constraintMaker make: ConstraintMaker, position: ViewPosition) {
        switch position {
        case .edgeToEdge:
            make.top.equalToSuperview().offset(contentEdgeInsets.top)
            make.bottom.equalToSuperview().offset(-contentEdgeInsets.bottom)
        case .start:
            make.top.equalToSuperview().offset(contentEdgeInsets.top)
            make.bottom.lessThanOrEqualToSuperview().offset(-contentEdgeInsets.bottom)
        case .end:
            make.bottom.equalToSuperview().offset(-contentEdgeInsets.bottom)
            make.top.greaterThanOrEqualToSuperview().offset(contentEdgeInsets.top)
        case .middle:
            make.centerY.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview().offset(contentEdgeInsets.top)
            make.bottom.lessThanOrEqualToSuperview().offset(-contentEdgeInsets.bottom)
        }
    }
    
    private func horizontallyConstrainView(constraintMaker make: ConstraintMaker, position: ViewPosition) {
        switch position {
        case .edgeToEdge:
            make.left.equalToSuperview().offset(contentEdgeInsets.left)
            make.right.equalToSuperview().offset(-contentEdgeInsets.right)
        case .start:
            make.left.equalToSuperview().offset(contentEdgeInsets.left)
            make.right.lessThanOrEqualToSuperview().offset(-contentEdgeInsets.right)
        case .end:
            make.right.equalToSuperview().offset(-contentEdgeInsets.right)
            make.left.lessThanOrEqualToSuperview().offset(contentEdgeInsets.left)
        case .middle:
            make.centerX.equalToSuperview()
            make.left.lessThanOrEqualToSuperview().offset(contentEdgeInsets.left)
            make.right.lessThanOrEqualToSuperview().offset(-contentEdgeInsets.right)
        }
    }
}



