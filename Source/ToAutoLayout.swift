//
//  ToAutoLayout.swift
//  Backstage
//
//  Created by Fernando Torcelly on 30/7/17.
//  Copyright © 2017 Fernando Torcelly. All rights reserved.
//

import UIKit

public class ToAutoLayout {
    
    // MARK: - Singleton Pattern
    
    public static let sharedController = ToAutoLayout()
    private init() {}
    
    // MARK: - Properties
    
    private var constraints: [NSLayoutConstraint]?
    
    // MARK: - Begin/End
    
    public func beginLayout() {
        constraints = [NSLayoutConstraint]()
    }
    
    public func endLayout() {
        assert(constraints != nil, "Error activating nil constraints")
        NSLayoutConstraint.activate(constraints!)
        constraints = nil
    }
    
    // MARK: - Operations
    
    public func append(view: UIView, toView: UIView) {
        self.append(view: view, toView: toView, left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
    }
    
    public func append(view: UIView, toView: UIView, left: CGFloat, top: CGFloat, right: CGFloat, bottom: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: top))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -right))
    }
    
    public func append(view: UIView, toView: UIView, top: CGFloat, left: CGFloat, bottom: CGFloat, width: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["width": width]
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: top))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: UIView, toView: UIView, top: CGFloat, right: CGFloat, bottom: CGFloat, width: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["width": width]
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: top))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: UIView, toView: UIView, middleX: CGFloat, top: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["width": width, "height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: middleX))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: top))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: UIView, toView: UIView, middleX: CGFloat, bottom: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["width": width, "height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: middleX))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: UIView, toView: UIView, middleX: CGFloat, middleY: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["width": width, "height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: middleX))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: middleY))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: UIView, toView: UIView, middleY: CGFloat, left: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["width": width, "height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: middleY))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: left))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: UIView, toView: UIView, middleY: CGFloat, right: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["width": width, "height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: middleY))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: UIView, toView: UIView, middleY: CGFloat, left: CGFloat, right: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: middleY))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: UIView, toView: UIView, left: CGFloat, bottom: CGFloat, right: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: UIView, toView: UIView, left: CGFloat, bottom: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["width": width, "height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: UIView, toView: UIView, left: CGFloat, top: CGFloat, right: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: top))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: UIView, toView: UIView, top: CGFloat, left: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["width": width, "height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: top))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: UIView, toView: UIView, top: CGFloat, right: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["width": width, "height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: top))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: UIView, toView: UIView, height: CGFloat, top: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 0.0))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: top))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 0.0))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: UIView, toView: UIView, height: CGFloat, bottom: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 0.0))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 0.0))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    
    // Getters
    
    public func constraint(_ view: UIView, toView: UIView?, attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        
        if attribute == .height || attribute == .width {
            let constraints = view.constraints
            for constraint in constraints {
                if constraint.firstAttribute == attribute || constraint.secondAttribute == attribute {
                    return constraint
                }
            }
            if let superview = view.superview {
                let constraints = superview.constraints
                for constraint in constraints {
                    if constraint.firstAttribute == attribute || constraint.secondAttribute == attribute {
                        return constraint
                    }
                }
            }
        }
        else {
            let constraints = view.constraints
            for constraint in constraints {
                if let firstItem = constraint.firstItem as? UIView,
                    let secondItem = constraint.secondItem as? UIView {
                    if (constraint.firstAttribute == attribute || constraint.secondAttribute == attribute) && (firstItem == view || secondItem == view) && (firstItem == toView || secondItem == toView) {
                        return constraint
                    }
                }
            }
            if let superview = view.superview {
                let constraints = superview.constraints
                for constraint in constraints {
                    if let firstItem = constraint.firstItem as? UIView,
                        let secondItem = constraint.secondItem as? UIView {
                        if (constraint.firstAttribute == attribute || constraint.secondAttribute == attribute) && (firstItem == view || secondItem == view) && (firstItem == toView || secondItem == toView) {
                            return constraint
                        }
                    }
                }
            }
        }
        return nil
    }
}
