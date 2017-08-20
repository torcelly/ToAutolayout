//
//  ToAutoLayout.swift
//  Backstage
//
//  Created by Fernando Torcelly on 30/7/17.
//  Copyright © 2017 Fernando Torcelly. All rights reserved.
//

import UIKit

class ToAutoLayout {
    
    // MARK: - Singleton Pattern
    
    static let sharedController = ToAutoLayout()
    private init() {}
    
    // MARK: - Properties
    
    var constraints: [NSLayoutConstraint]?
    
    // MARK: - Begin/End
    
    func beginLayout() {
        constraints = [NSLayoutConstraint]()
    }
    
    func endLayout() {
        assert(constraints != nil, "Error activating nil constraints")
        NSLayoutConstraint.activate(constraints!)
        constraints = nil
    }
    
    // MARK: - Operations
    
    func append(view: UIView, toView: UIView) {
        self.append(view: view, toView: toView, top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    func append(view: UIView, toView: UIView, top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: top))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -right))
    }
    
    func append(view: UIView, toView: UIView, middleX: CGFloat, top: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["width": width, "height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: middleX))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: top))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    func append(view: UIView, toView: UIView, middleX: CGFloat, bottom: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["width": width, "height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: middleX))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    func append(view: UIView, toView: UIView, middleY: CGFloat, left: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["width": width, "height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: middleY))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: left))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    func append(view: UIView, toView: UIView, middleY: CGFloat, right: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["width": width, "height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: middleY))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    func append(view: UIView, toView: UIView, middleY: CGFloat, left: CGFloat, right: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: middleY))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    func append(view: UIView, toView: UIView, left: CGFloat, bottom: CGFloat, right: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    func append(view: UIView, toView: UIView, left: CGFloat, top: CGFloat, right: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: top))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    func append(view: UIView, toView: UIView, top: CGFloat, left: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["width": width, "height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: left))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: top))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    func append(view: UIView, toView: UIView, top: CGFloat, right: CGFloat, width: CGFloat, height: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["width": width, "height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -right))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: top))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[view(width)]", options: [], metrics: metrics, views: views))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    func append(view: UIView, toView: UIView, height: CGFloat, top: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 0.0))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: top))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 0.0))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
    
    func append(view: UIView, toView: UIView, height: CGFloat, bottom: CGFloat) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views   = ["view": view]
        let metrics = ["height": height]
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 0.0))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -bottom))
        constraints?.append(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: toView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 0.0))
        constraints?.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[view(height)]", options: [], metrics: metrics, views: views))
    }
}
