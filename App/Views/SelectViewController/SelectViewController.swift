//
//  SelectViewController.swift
//  Project
//
//  Created by Victor Catão on 23/04/19.
//  Copyright (c) 2019 Catao. All rights reserved.
//

import UIKit

protocol SelectViewControllerDelegate: class {
    func didSelect(items: [SelectModel])
}

class SelectViewController: UIViewController {
    
    let CELL_IDENTIFIER = "SelectTableViewCell"
    
    convenience required init(items: [SelectModel]) {
        self.init()
        self.viewModel.items = items
    }
    
    // MARK: - Variables
    private let viewModel = SelectViewModel()
    weak var delegate: SelectViewControllerDelegate?
    
    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: - Setups
    private func setup() {
        title = "Selecione"
        setupTableView()
    }
    
    func setupTableView(){
        self.tableView.registerNib(named: CELL_IDENTIFIER)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // MARK: - Actions
    @IBAction func didTapOkButton(_ sender: Any) {
        delegate?.didSelect(items: self.viewModel.getSelectedItems())
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - TableView
extension SelectViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER) as! SelectTableViewCell
        cell.setup(item: self.viewModel.getItem(at: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.select(at: indexPath.row)
        self.tableView.reloadData()
    }
}
