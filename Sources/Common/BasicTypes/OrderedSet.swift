//
//  OrderedSet.swift
//  Common
//
//  Created by Doddy Tri Hutomo on 30/11/20.
//  Copyright © 2020 Vidio. All rights reserved.
//

import Foundation

public struct OrderedSet<Element: Hashable> {
    private var set = Set<Element>()
    public var array = [Element]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public func contains(_ item: Element) -> Bool {
        return set.contains(item)
    }
    
    public mutating func insert(item: Element) {
        guard set.contains(item) == false else { return }
        set.insert(item)
        array.append(item)
    }
    
    public mutating func insert(items: [Element]) {
        items.forEach { item in
            insert(item: item)
        }
    }
    
    public mutating func remove(item: Element) {
        guard set.contains(item),
            let index = array.firstIndex(where: { $0 == item })
            else { return }
        
        set.remove(item)
        array.remove(at: index)
    }
    
    public mutating func removeAll() {
        array.removeAll()
        set.removeAll()
    }
}

extension OrderedSet: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        elements.forEach { item in
            insert(item: item)
        }
    }
    
    public init(items: [Element]) {
        items.forEach { item in
            insert(item: item)
        }
    }
    
    public static func + (_ lhs: OrderedSet<Element>, _ rhs: OrderedSet<Element>) -> OrderedSet<Element> {
        var set = OrderedSet<Element>()
        set.insert(items: lhs.array + rhs.array)
        
        return set
    }
}

extension OrderedSet: Equatable {
    public static func == (lhs: OrderedSet, rhs: OrderedSet) -> Bool {
        return lhs.set == rhs.set
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(set)
    }
}
