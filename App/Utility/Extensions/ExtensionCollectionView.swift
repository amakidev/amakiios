//
//  ExtensionCollectionViewController.swift
//  Catao
//
//  Created by Catao on 5/21/18.
//  Copyright © 2018 Catao. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    // MARK: - RegisterNib
    /**
     Registra a nib na collectionview
     */
    func registerNib(named name: String){
        register(UINib(nibName: name, bundle: nil), forCellWithReuseIdentifier: name)
    }

}
