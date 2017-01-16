//
//  ViewController.swift
//  RootViewGettable
//
//  Created by Artem Chabannyi on 1/10/17.
//  Copyright © 2017 IDAP Group. All rights reserved.
//

import UIKit
import IDPRootViewGettable
import ReactiveSwift
import ReactiveCocoa
import IDPCastable

class ViewController: UIViewController, RootViewGettable, UITableViewDataSource, UITableViewDelegate {

    typealias RootViewType = MyRootView
    
    // MARK: - Properties
    
    private var objects: [Country] = []

    private let startPage = Pagination(perpage: 15, page: 1)
    lazy private var pagination: Pagination = { [unowned self] in
        return self.startPage
    }()
    
    private var blockWhileLoading: Bool = false
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSettings()
        self.loadCountriesAtStart()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: CountryTableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        return castable(cell) { (cell: CountryTableViewCell) in
            cell.fill(withModel: self.objects[indexPath.row])
        }.extract()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row >= self.objects.count - 2 {
            self.loadNextCountries()
        }
    }
    
    // MARK: - Private mathods
    
    private func tableViewSettings() {
        let tableView = self.rootView?.tableView
        let cellName = String(describing: CountryTableViewCell.self)
        let nib = UINib(nibName: cellName, bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: cellName)
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 100
    }
    
    private func loadCountriesAtStart() {
        self.loadCountries(pagination: self.startPage)
    }
    
    private func loadNextCountries() {
        if false == self.blockWhileLoading {
            self.loadCountries(pagination: self.pagination.incrementPage())
        }
    }
    
    private func loadCountries(pagination: Pagination) {
        self.blockWhileLoading = true
        getCountries(self.pagination)
            .take(until: self.reactive.lifetime.ended)
            .observe(on: QueueScheduler.main)
            .startWithResult { [unowned self] result in
                switch result {
                case .success(let value):
                    value.map { value in
                        self.objects.append(contentsOf: value)
                        if value.count > 0 {
                            self.pagination = pagination
                            self.rootView?.tableView?.reloadData()
                        }
                    }
                case .failure(let error):
                    var message = "undefined"
                    switch error {
                    case .error( let error):
                        message = error.localizedDescription
                    default: break
                    }
                    self.showAlert(title: "Error", message: message)
                }
                self.blockWhileLoading = false
        }
    }
    
}

