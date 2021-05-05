//
//  NonEmptyString.swift
//  vidio
//
//  Created by woi on 13/03/19.
//  Copyright © 2019 woi. All rights reserved.
//

import Foundation

public struct NonEmptyString : Equatable {
    public let value: String

    public init?(_ source: String?) {
        guard let source = source, !source.isEmpty else { return nil }
        value = source
    }
}
