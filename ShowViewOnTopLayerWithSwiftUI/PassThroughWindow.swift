//
//  PassThroughWindow.swift
//  ShowViewOnTopLayerWithSwiftUI
//
//  Created by Gaurav Tak on 29/07/23.
//

import UIKit


class PassThroughWindow: UIWindow {
    private static func _hitTest(
        _ point: CGPoint,
        with event: UIEvent?,
        view: UIView,
        depth: Int = 0
    ) -> Optional<(view: UIView, depth: Int)> {
        var deepest: Optional<(view: UIView, depth: Int)> = .none
        
        /// views are ordered back-to-front
        for subview in view.subviews.reversed() {
            let converted = view.convert(point, to: subview)
            
            guard subview.isUserInteractionEnabled,
                  !subview.isHidden,
                  subview.alpha > 0,
                  subview.point(inside: converted, with: event)
            else {
                continue
            }
            
            let result = if let hit = Self._hitTest(
                converted,
                with: event,
                view: subview,
                depth: depth + 1
            ) {
                hit
            } else  {
                (view: subview, depth: depth)
            }
            
            if case .none = deepest {
                deepest = result
            } else if let current = deepest, result.depth > current.depth {
                deepest = result
            }
        }
        
        return deepest
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if #available(iOS 18, *) {
            guard let view = rootViewController?.view else {
                return false
            }
            
            let hit = Self._hitTest(
                point,
                with: event,
                view: subviews.count > 1 ? self : view
            )
            
            return hit != nil
        } else {
            return super.point(inside: point, with: event)
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if #available(iOS 18, *) {
            return super.hitTest(point, with: event)
        } else {
            guard let hit = super.hitTest(point, with: event) else {
                return .none
            }
            return rootViewController?.view == hit ? .none : hit
        }
    }
}
