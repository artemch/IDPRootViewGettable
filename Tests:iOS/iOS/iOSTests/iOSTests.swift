//
//  iOSTests.swift
//  iOSTests
//
//  Created by Artem Chabannyi on 1/13/17.
//  Copyright © 2017 IDAP Group. All rights reserved.
//

import Quick
import Nimble
import UIKit

@testable import RootViewGettable

class ViewTestClass: UIView {}

class ViewControllerTestClass: UIViewController, RootViewGettable {
    
    typealias RootViewType = ViewTestClass
    
    override func loadView() {
        self.view = ViewTestClass()
    }
}

class ViewControllerRootViewSpec: QuickSpec {
    override func spec() {
        
        describe("rootView") {
            let viewController = ViewControllerTestClass()
            
            context("when view not loaded") {
                it("should return nil") {
                    expect(viewController.rootView).to(beNil())
                }
            }
            
            context("when view loaded") {
                it("should return view") {
                    let _ = viewController.view
                    expect(viewController.rootView).notTo(beNil())
                }
                
                context("view and rootView") {
                    it("should be equal") {
                        let equal = viewController.rootView == Optional(viewController.view)
                        expect(equal).to(beTrue())
                    }
                }
                
                context("rootView") {
                    it("should be the type of ViewTestClass") {
                        let equal = type(of:viewController.rootView) == Optional<ViewTestClass>.self
                        expect(equal).to(beTrue())
                    }
                }
            }
        }
    }
}
