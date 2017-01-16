//
//  NetworkGetCountries.swift
//  iOS
//
//  Created by Artem Chabannyi on 1/13/17.
//  Copyright © 2017 IDAP Group. All rights reserved.
//

import Foundation
import Alamofire
import Argo
import ReactiveSwift
import Result

private let responseQueue = DispatchQueue(label: "networkResponseQueue", attributes: .concurrent)

func getCountries(_ pagination: Pagination) -> SignalProducer<[Country]?, ResponseError> {
    return SignalProducer { (observer, compositeDisposable) in
        let parameters: Parameters = ["per_page": pagination.perpage,
                                      "format": "json",
                                      "page": pagination.page]
        let request = Alamofire.request("http://api.worldbank.org/country",
                                        method: .get,
                                        parameters: parameters)
            .responseJSON(queue: responseQueue) { response in
                switch response.result {
                case .success(let value):
                    var countries: [Country]? = nil
                    cast(value, type: [Any].self)?.last.map{ countries = decode($0) }
                    observer.send(value: countries)
                    observer.sendCompleted()
                    
                case let .failure(error):
                    var responseError: ResponseError = .undefined
                    cast(error, type: AFError.self).map { responseError = .error($0) }
                    observer.send(error: responseError)
                }
                
        }
        compositeDisposable.add {
            request.cancel()
        }
    }
}
