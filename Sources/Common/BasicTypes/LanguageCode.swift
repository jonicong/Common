//
//  LanguageCode.swift
//  Common
//
//  Created by Joni Cong on 27/04/21.
//  Copyright © 2021 Vidio. All rights reserved.
//

import Foundation

public struct LanguageCode {
    
    public init?(_ value: String?) {
        switch value {
        case .some(let value): self.value = value
        case .none: return nil
        }
    }
    
    public let value: String
}
