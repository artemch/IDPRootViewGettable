//
//  NetworkResponseError.swift
//  iOS
//
//  Created by Artem Chabannyi on 1/16/17.
//  Copyright © 2017 IDAP Group. All rights reserved.
//

import Foundation
import Alamofire

enum ResponseError: Error {
    case undefined
    case error(AFError)
}
