//
//  ToAutoLayout.swift
//  Backstage
//
//  Created by Fernando Torcelly on 30/7/17.
//  Copyright © 2017 Fernando Torcelly. All rights reserved.
//

#if os(OSX)
import Cocoa
#elseif os(iOS)
import UIKit
#endif

public class ToAutoLayout {
    
    #if os(OSX)
    public typealias View = NSView
    #elseif os(iOS)
    public typealias View = UIView
    #endif
    
    // MARK: - Singleton Pattern
    
    public static let shared = ToAutoLayout()
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
    
    public func append(view: View, toView: View) {
        self.append(view: view, toView: toView, left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
    }
    
    public func append(view: View, toView: View, left: CGFloat, top: CGFloat, right: CGFloat, bottom: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: top))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: -right))
    }
    
    public func append(view: View, toView: View, left: CGFloat, top: CGFloat, bottom: CGFloat, width: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        
        #if os(OSX)
        let metrics = ["width": width] as [String : NSNumber]
        #elseif os(iOS)
        let metrics = ["width": width]
        #endif
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: top))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
    }

    public func append(view: View, toView: View, top: CGFloat, right: CGFloat, bottom: CGFloat, width: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        
        #if os(OSX)
        let metrics = ["width": width] as [String : NSNumber]
        #elseif os(iOS)
        let metrics = ["width": width]
        #endif
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: top))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: View, toView: View, centerX: CGFloat, top: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        
        #if os(OSX)
        let metrics = ["width": width, "height": height] as [String : NSNumber]
        #elseif os(iOS)
        let metrics = ["width": width, "height": height]
        #endif
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1.0, constant: centerX))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: top))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: View, toView: View, centerX: CGFloat, bottom: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        
        #if os(OSX)
        let metrics = ["width": width, "height": height] as [String : NSNumber]
        #elseif os(iOS)
        let metrics = ["width": width, "height": height]
        #endif
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1.0, constant: centerX))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: View, toView: View, centerX: CGFloat, centerY: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        
        #if os(OSX)
        let metrics = ["width": width, "height": height] as [String : NSNumber]
        #elseif os(iOS)
        let metrics = ["width": width, "height": height]
        #endif
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1.0, constant: centerX))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1.0, constant: centerY))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: View, toView: View, centerY: CGFloat, left: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        
        #if os(OSX)
        let metrics = ["width": width, "height": height] as [String : NSNumber]
        #elseif os(iOS)
        let metrics = ["width": width, "height": height]
        #endif
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1.0, constant: centerY))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: left))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: View, toView: View, centerY: CGFloat, right: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        
        #if os(OSX)
        let metrics = ["width": width, "height": height] as [String : NSNumber]
        #elseif os(iOS)
        let metrics = ["width": width, "height": height]
        #endif
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1.0, constant: centerY))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: View, toView: View, centerY: CGFloat, left: CGFloat, right: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]

        #if os(OSX)
        let metrics = ["height": height] as [String : NSNumber]
        #elseif os(iOS)
        let metrics = ["height": height]
        #endif
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1.0, constant: centerY))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: View, toView: View, left: CGFloat, right: CGFloat, bottom: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]

        #if os(OSX)
        let metrics = ["height": height] as [String : NSNumber]
        #elseif os(iOS)
        let metrics = ["height": height]
        #endif
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: View, toView: View, left: CGFloat, bottom: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        
        #if os(OSX)
        let metrics = ["width": width, "height": height] as [String : NSNumber]
        #elseif os(iOS)
        let metrics = ["width": width, "height": height]
        #endif
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: View, toView: View, left: CGFloat, top: CGFloat, right: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]

        #if os(OSX)
        let metrics = ["height": height] as [String : NSNumber]
        #elseif os(iOS)
        let metrics = ["height": height]
        #endif
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: top))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: View, toView: View, right: CGFloat, bottom: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        
        #if os(OSX)
        let metrics = ["width": width, "height": height] as [String : NSNumber]
        #elseif os(iOS)
        let metrics = ["width": width, "height": height]
        #endif
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: View, toView: View, left: CGFloat, top: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        
        #if os(OSX)
        let metrics = ["width": width, "height": height] as [String : NSNumber]
        #elseif os(iOS)
        let metrics = ["width": width, "height": height]
        #endif
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: top))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: View, toView: View, top: CGFloat, right: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false

        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: top))
        constraints?.append(NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: width))
        constraints?.append(NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1.0, constant: height))
    }
    
    public func append(view: View, toView: View, top: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]

        #if os(OSX)
        let metrics = ["height": height] as [String : NSNumber]
        #elseif os(iOS)
        let metrics = ["height": height]
        #endif
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: 0.0))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: top))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: 0.0))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    public func append(view: View, toView: View, bottom: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]

        #if os(OSX)
        let metrics = ["height": height] as [String : NSNumber]
        #elseif os(iOS)
        let metrics = ["height": height]
        #endif
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: 0.0))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: 0.0))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    
    // Getters
    
    public func constraint(_ view: View, toView: View?, attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        
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
                if let firstItem = constraint.firstItem as? View,
                    let secondItem = constraint.secondItem as? View {
                    if (constraint.firstAttribute == attribute || constraint.secondAttribute == attribute) && (firstItem == view || secondItem == view) && (firstItem == toView || secondItem == toView) {
                        return constraint
                    }
                }
            }
            if let superview = view.superview {
                let constraints = superview.constraints
                for constraint in constraints {
                    if let firstItem = constraint.firstItem as? View,
                        let secondItem = constraint.secondItem as? View {
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
