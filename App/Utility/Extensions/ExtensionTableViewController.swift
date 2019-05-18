//
//  TableViewControllerCatao.swift
//  Catao
//
//  Created by Catao on 19/12/2017.
//  Copyright © 2017 Catao. All rights reserved.
//

import UIKit

extension UITableViewController {
    
    // MARK: - Pull to Refresh
    /**
     Insere o Pull to refresh na TableView
     É necessário dar overrie no refreshData()
     */
    func addPullToRefresh(){
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(didPullToRefresh(_:)), for: .valueChanged)
        self.refreshControl = refresh
    }
    
    @objc private func didPullToRefresh(_ sender: Any) {
        self.refreshData()
    }
    
    func removePullToRefresh(){
        self.refreshControl = nil
    }
    
    // OVERRIDE IT!
    @objc func refreshData(){}
    
    func stopRefreshing(){
        self.tableView.refreshControl?.endRefreshing()
    }
    
    // MARK: - Load more
    /*
     Automatiamente carrega mais itens quando chega na última célula
     É necessário dar override em loadMore()
     */
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let numberOfRows = tableView.numberOfRows(inSection: indexPath.section)
        if(indexPath.row == numberOfRows) {
            loadMore()
        }
    }
    
    // OVERRIDE IT!
    @objc func loadMore(){}
    
    // MARK: - RegisterNib
    /**
     Registra a nib na tableView
     */
    func registerNib(named: String){
        self.tableView.register(UINib(nibName: named, bundle: nil), forCellReuseIdentifier: named)
    }
    
}

