//
//  IDPCastable+Extension.swift
//  iOS
//
//  Created by Artem Chabannyi on 1/16/17.
//  Copyright © 2017 IDAP Group. All rights reserved.
//

import Foundation
import IDPCastable

public func cast<Type, Result>(_ value: Type, type: Result.Type) -> Result? {
    return cast(value)
}
