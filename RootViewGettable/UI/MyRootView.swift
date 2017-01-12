//
//  MyView.swift
//  RootViewGettable
//
//  Created by Artem Chabannyi on 1/10/17.
//  Copyright © 2017 IDAP Group. All rights reserved.
//

import UIKit

class MyRootView: UIView {
    
    // MARK: - Properties
    
    @IBOutlet var sliderView: UISlider?
    @IBOutlet var valueLabel: UILabel?
    @IBOutlet var rotationView: UIView?
    
    // MARK: - Public mathods
    
    func update(forValue value: Float) {
        self.valueLabel?.text = String(value)
        self.rotationView.map { view in
            let angle = Float.pi * 180 * value / 180.0
            view.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
        }
    }
    
}
