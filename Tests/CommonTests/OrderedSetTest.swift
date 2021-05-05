//
//  OrderedSetTest.swift
//  CommonTests
//
//  Created by Doddy Tri Hutomo on 30/11/20.
//  Copyright © 2020 Vidio. All rights reserved.
//

import XCTest
@testable import Common

class OrderedSetTest: XCTestCase {
    
    struct HashableItem: Hashable {
        let value: Int
    }

    func testInit() {
        let orderedSet = OrderedSet<HashableItem>()
        
        XCTAssertTrue(orderedSet.isEmpty)
        XCTAssertFalse(orderedSet.contains(HashableItem(value: 1)))
    }
    
    func testInsertUniqueElement() {
        var orderedSet = OrderedSet<HashableItem>()
        
        orderedSet.insert(item: HashableItem(value: 1))
        orderedSet.insert(item: HashableItem(value: 2))
        orderedSet.insert(item: HashableItem(value: 3))

        XCTAssertFalse(orderedSet.isEmpty)
        XCTAssertEqual(orderedSet.count, 3)
    }

    func testInsertSameElement() {
        var orderedSet = OrderedSet<HashableItem>()
        
        orderedSet.insert(item: HashableItem(value: 1))
        orderedSet.insert(item: HashableItem(value: 1))
        orderedSet.insert(item: HashableItem(value: 1))
        
        XCTAssertFalse(orderedSet.isEmpty)
        XCTAssertEqual(orderedSet.count, 1)
    }
    
    func testInsertSameElements() {
        var orderedSet = OrderedSet<HashableItem>()

        let items = [HashableItem(value: 1),
                     HashableItem(value: 1),
                     HashableItem(value: 1)]
        
        orderedSet.insert(items: items)
        
        XCTAssertFalse(orderedSet.isEmpty)
        XCTAssertEqual(orderedSet.count, 1)
    }

    func testInsertUniqueElements() {
        var orderedSet = OrderedSet<HashableItem>()
        
        let items = [HashableItem(value: 1),
                     HashableItem(value: 2),
                     HashableItem(value: 3)]

        orderedSet.insert(items: items)

        XCTAssertFalse(orderedSet.isEmpty)
        XCTAssertEqual(orderedSet.count, 3)
    }
    
    func testContains() {
        var orderedSet = OrderedSet<HashableItem>()
        let insertedItem = HashableItem(value: 1)
        let notInsertedItem = HashableItem(value: 10)
        
        orderedSet.insert(item: insertedItem)
        
        XCTAssertTrue(orderedSet.contains(insertedItem))
        XCTAssertFalse(orderedSet.contains(notInsertedItem))
    }

    func testRemove() {
        var orderedSet = OrderedSet<HashableItem>()
        let item = HashableItem(value: 1)
        
        orderedSet.remove(item: item)
        orderedSet.insert(item: item)
        orderedSet.remove(item: item)

        XCTAssertTrue(orderedSet.isEmpty)
        XCTAssertFalse(orderedSet.contains(HashableItem(value: 1)))
    }

    func testRemoveAll() {
        var orderedSet = OrderedSet<HashableItem>()
        let firstItem = HashableItem(value: 1)
        let secondItem = HashableItem(value: 2)
        
        orderedSet.insert(item: firstItem)
        orderedSet.insert(item: secondItem)
        
        orderedSet.removeAll()
        
        XCTAssertTrue(orderedSet.isEmpty)
        XCTAssertEqual(orderedSet.count, 0)
        XCTAssertFalse(orderedSet.contains(firstItem))
        XCTAssertFalse(orderedSet.contains(secondItem))
    }

    func testExpressibleByArrayLiteral() {
        let orderedSet: OrderedSet<HashableItem> = [HashableItem(value: 1),
                                                    HashableItem(value: 1),
                                                    HashableItem(value: 2),
                                                    HashableItem(value: 2)]

        XCTAssertFalse(orderedSet.isEmpty)
        XCTAssertEqual(orderedSet.count, 2)
    }
    
    func testConcatenation() {
        let setA: OrderedSet<HashableItem> = [HashableItem(value: 1),
                                              HashableItem(value: 2)]
        
        let setB: OrderedSet<HashableItem> = [HashableItem(value: 3),
                                              HashableItem(value: 1)]
        
        let expectedSet: OrderedSet<HashableItem> = [HashableItem(value: 1),
                                                     HashableItem(value: 2),
                                                     HashableItem(value: 3)]
        
        XCTAssertEqual((setA+setB), expectedSet)
    }
    
}
