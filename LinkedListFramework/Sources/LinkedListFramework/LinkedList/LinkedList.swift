//
//  File.swift
//  
//
//  Created by Pedro Henrique Guedes Silveira on 08/04/20.
//

import Foundation

public class LinkedList <T>{
    
    var head: Node<T>?
    var tail: Node<T>?
    var lenght: Int = 0
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var firsItem: Node<T>? {
        return head
    }
    
    public var lastItem: Node<T>?{
        return tail
    }
    
    public func append(newValue: T) {
        
        let newNode = Node(value: newValue)
        
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
        lenght += 1
    }
    
    public func nodeAt(index: Int) -> T?{
        
        if index >= 0 {
            
            let average = lenght / 2
            
            if index < average {
                var node = head 
                
                for _ in 0..<index {
                    node = node?.next
                }
                return node?.value
                
            } else {
                var node = tail 
                
                for _ in 0..<(lenght - index) {
                    node = node?.previous
                }
                return node?.value
            }
        }
        return nil
    }
    
    private func findNodeBy(index: Int) -> Node<T>? {
        
        if index >= 0 {
            
            let average = lenght / 2
            
            if index < average {
                var node = head 
                
                for _ in 0..<index {
                    node = node?.next
                }
                return node
                
            } else {
                var node = tail 
                
                for _ in 0..<(lenght - index) {
                    node = node?.previous
                }
                return node
            }
        }
        return nil
    }
    
    public func removeAll() {
        head?.deleteAll()
    }
    
    public func removeAt(index: Int) {
        
        guard let removedNode = findNodeBy(index: index) else {
            return
        }
        
        let previousNode = removedNode.previous
        let nextNode = removedNode.next
        
        if let previousNode = previousNode {
            previousNode.next = nextNode
        } else {
            head = nextNode
        }
        
        if nextNode == nil {
            tail = previousNode
        } else {
            nextNode?.previous = previousNode
        }
        
        removedNode.value = nil
        removedNode.next = nil
        removedNode.previous = nil
        
    }
    
}

