//
//  LoginViewController.swift
//  Catao
//
//  Created by Catao on 18/12/2017.
//  Copyright © 2017 Catao. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    
    let viewModel = LoginViewModel()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObservers()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK:- Scroll View Content Inset
    override func setScrollViewContentInset(_ inset: UIEdgeInsets) {
        scrollView.contentInset = inset
    }
    
    // MARK: - Setups
    func setup() {
        setupBack()
        setupAutoScrollWhenKeyboardShowsUp()
        setupTextFields()
    }
    
    func setupTextFields() {
        
    }
    
    func setupLabels() {
        
    }
    
    // MARK:- Taps
    @IBAction func didTapForgotPassword(_ sender: Any) {
        
    }
    
    @IBAction func didTapDontHavePassword(_ sender: Any) {
        
    }
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        
    }
    
    
    @objc func didTapTerms() {
        let url = URL(string: "https://policlinsaude.com.br/termos-de-uso-e-politica-de-privacidade.html")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @objc func didTapPrivacy() {
        let url = URL(string: "https://policlinsaude.com.br/termos-de-uso-e-politica-de-privacidade.html")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    // MARK: - Helpers
    private func openHome() {
        let home = AppDelegate().getHomeViewController()
        UIApplication.shared.windows.first?.rootViewController = home
    }
    
}
