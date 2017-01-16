//
//  Pagination.swift
//  iOS
//
//  Created by Artem Chabannyi on 1/16/17.
//  Copyright © 2017 IDAP Group. All rights reserved.
//

import Foundation

struct Pagination {
    let perpage: Int
    let page: Int
}

extension Pagination {
    
    func updatePage(page: Int) -> Pagination {
        return Pagination(perpage: self.perpage, page: page)
    }
    
    func incrementPage() -> Pagination {
        return self.updatePage(page: self.page + 1)
    }
    
}
