//
//  LinkedList.swift
//  SwiftUI-LinkedList
//
//  Created by Chris on 3/23/20.
//  Copyright © 2020 NSChris. All rights reserved.
//

import Foundation

// Double Linked List
public class LinkedList
{
    // Mark: - Keep references of head and tail
    fileprivate var _head: Node?
    fileprivate var _tail: Node?
    
    // MARK: - Computed Properties
    public var isEmpty: Bool {
        return _head == nil
    }
    
    public var size: Int {
        var index : Int = 0
        if _head != nil {
            var node = _head
            while (node != nil) {
                node = node?.next
                index += 1
            }
        }
        return index
    }
    
    public var head: Node? {
        return _head
    }
    
    public var tail : Node? {
        return _tail
    }
    
    // MARK: - Helper functions
    public func insert(value: String) {
        let newNode: Node = Node(value: value)
        
        if _head != nil {
            _head?.previous = newNode
            newNode.next = _head
            _head = newNode
        }
        else {
            _tail = newNode
        }
        _head = newNode
    }
    
    public func append(value: String) {
        let newNode: Node = Node(value: value)
        
        if _tail != nil {
            _tail?.next = newNode
            newNode.previous = _tail
        }
        else {
            _head = newNode
        }
        _tail = newNode
    }
    
    public func nodeAtIndex(_ index: Int) -> Node? {
      if index >= 0 {
          var node = _head
          var iterationLeft = index
          while node != nil {
            if iterationLeft == 0 {
                return node
            }
            iterationLeft -= 1
            node = node!.next
          }
        }
        return nil
    }
    
    public func clear() {
        if _head != nil {
            var node = _head
            while (node != nil) {
                _head = node
                node = node?.next
                _head = nil
            }
        }
        _tail = nil
    }
    
    public func removeNodeAtIndex(_ index: Int) {
        if let node = self.nodeAtIndex(index) {
            remove(node: node)
        }
    }
    
    public func remove(node: Node) {
        let prevNode = node.previous
        let nextNode = node.next
        
        if prevNode != nil {
            prevNode!.next = nextNode
        } else {
            _head = nextNode
        }
        
        nextNode?.previous = prevNode
        
        if nextNode == nil {
            _tail = prevNode
        }
        
        node.previous = nil
        node.next = nil
    }
}
