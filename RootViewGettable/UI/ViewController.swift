//
//  ViewController.swift
//  RootViewGettable
//
//  Created by Artem Chabannyi on 1/10/17.
//  Copyright © 2017 IDAP Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RootViewGettable {

    typealias RootViewType = MyRootView
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rootView?.rotationView?.backgroundColor = UIColor.red
    }

    // MARK: - Interface Handling
    
    @IBAction func onValueChange(_ sender: UISlider) {
        let value = sender.value
        self.rootView?.update(forValue: value)
    }
    
}

