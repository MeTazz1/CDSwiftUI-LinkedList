//
//  Node.swift
//  SwiftUI-LinkedList
//
//  Created by Chris on 3/23/20.
//  Copyright © 2020 NSChris. All rights reserved.
//

import Foundation

final public class Node {
    // Content of Node
    fileprivate var _value: String
    
    // MARK: - Double Linked List Properties
    weak var previous: Node? // Mark previous weak to make sure that it is correctly erased if previous is deleted
    var next: Node?
    
    init(value: String) {
        _value = value
    }
    
    // MARK: - Getter
    public func getValue() -> String {
        return _value;
    }
    
    // MARK: - Setter
    public func setValue(newValue: String) {
        _value = newValue
    }
}
