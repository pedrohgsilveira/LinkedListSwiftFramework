//
//  File.swift
//  
//
//  Created by Pedro Henrique Guedes Silveira on 08/04/20.
//

import Foundation

public class Node<T> {
    
    var value: T? 
    
    weak var previous: Node?
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
    
    func deleteAll(){
        if let next = next {
            next.deleteAll()
        }
        next = nil
    }
}
