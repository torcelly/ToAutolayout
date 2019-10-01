//
//  ToConstraint.swift
//  ToAutoLayout
//
//  Created by Fernando Torcelly Garcia on 29/09/2019.
//  Copyright © 2019 Fernando Torcelly. All rights reserved.
//

import Foundation

public class ToConstraint {
    
    private var constraints: [NSLayoutConstraint] = []
    public var constant: CGFloat {
        get {
            return constraints.first == nil ? 0 : constraints.first!.constant
        }
        set(newConstant) {
            constraints.forEach({ $0.constant = newConstant })
        }
    }
    
    internal func append(_ item: NSLayoutConstraint) {
        constraints.append(item)
    }
}
