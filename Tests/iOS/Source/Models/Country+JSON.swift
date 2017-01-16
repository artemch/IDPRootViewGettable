//
//  Country+JSON.swift
//  iOS
//
//  Created by Artem Chabannyi on 1/13/17.
//  Copyright © 2017 IDAP Group. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

extension Country: Decodable {
    public static func decode(_ j: JSON) -> Decoded<Country> {
        return curry(Country.init)
            <^> j <| "id"
            <*> j <| "name"
            <*> j <| "region"
    }
}
