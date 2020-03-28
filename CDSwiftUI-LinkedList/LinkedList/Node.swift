//
//  Node.swift
//  SwiftUI-LinkedList
//
//  Created by Chris on 3/23/20.
//  Copyright © 2020 NSChris. All rights reserved.
//

import Foundation

final public class Node<T>{
    // Content of Node
    private var _value: T
        
    // MARK: - Double Linked List Properties
    weak var previous: Node? // Mark previous weak to make sure that it is correctly erased if previous is deleted
    var next: Node?
    
    init(value: T) {
        _value = value
    }
    
    // MARK: - Getter
    public func getValue() -> T {
        return _value;
    }
    
    // MARK: - Setter
    public func setValue(newValue: T) {
        _value = newValue
    }
}
