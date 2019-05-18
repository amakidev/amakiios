//
//  ExtensionTableView.swift
//  Catao
//
//  Created by Catao on 27/04/2018.
//  Copyright © 2018 Catao. All rights reserved.
//

import UIKit

extension UITableView {
    // MARK: - RegisterNib
    /**
     Registra a nib na tableView
     */
    func registerNib(named name: String){
        register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
}
