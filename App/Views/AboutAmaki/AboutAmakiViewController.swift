//
//  AboutAmakiViewController.swift
//  Project
//
//  Created by Victor Catão on 28/04/19.
//  Copyright (c) 2019 Catao. All rights reserved.
//

import UIKit

class AboutAmakiViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    // MARK: - Variables
    private let viewModel = AboutAmakiViewModel()
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.downloadData()
    }
    
    // MARK: - Setups
    private func setup() {
        title = "Sobre o Amaki"
    }
    
    func downloadData() {
        self.showLoader()
        self.viewModel.fetchAbout(success: {
            self.textLabel.text = self.viewModel.getText()
            self.hideLoader()
        }) { (msg) in
            self.showErrorAlert(message: msg)
        }
    }
    
}
