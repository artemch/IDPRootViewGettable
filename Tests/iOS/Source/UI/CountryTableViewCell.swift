//
//  CountryTableViewCell.swift
//  iOS
//
//  Created by Artem Chabannyi on 1/16/17.
//  Copyright © 2017 IDAP Group. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet var countryName: UILabel?
    @IBOutlet var countryRegion: UILabel?
    
    // MARK: - Public mathods
    
    func fill(withModel model: Country) {
        self.countryName?.text = model.name
        self.countryRegion?.text = model.region.value
    }
    
}
