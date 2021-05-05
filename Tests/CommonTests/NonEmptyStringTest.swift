//
//  NonEmptyStringTest.swift
//  vidioTests
//
//  Created by woi on 13/03/19.
//  Copyright © 2019 woi. All rights reserved.
//

import XCTest
@testable import Common

class NonEmptyStringTest: XCTestCase {

    func testInit() {
        XCTAssertNil(NonEmptyString(""))
        XCTAssertNotNil(NonEmptyString("someString"))
    }
}
