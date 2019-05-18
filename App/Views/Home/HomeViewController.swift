//
//  HomeViewController.swift
//  Project
//
//  Created by Victor Catão on 21/04/19.
//  Copyright (c) 2019 Catao. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Cosntants
    private let ESTABLISHMENT_CELL_IDENTIFIER = "EstablishmentTableViewCell"
    private let CATEGORY_CELL_IDENTIFIER = "CategoryCollectionViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mapButtonView: CataoUIView!
    private var titleLabel: UILabel!
    
    // MARK: - Variables
    private let viewModel = HomeViewModel()
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.fetchData()
    }
    
    func fetchData() {
        self.showLoader()
        self.viewModel.fetchCities(success: {
            
            self.viewModel.fetchCategories(success: {
                self.hideLoader()
                self.collectionView.reloadData()
                self.fetchEstablishments()
            }, error: { (msg) in
                self.hideLoader()
                self.showErrorAlert(message: msg)
            })
            
        }) { (msg) in
            self.hideLoader()
            self.showErrorAlert(message: msg)
        }
    }
    
    func fetchEstablishments() {
        self.showLoader()
        self.viewModel.fetchEstablishments(success: {
            self.hideLoader()
            self.tableView.reloadData()
        }, error: { (msg) in
            self.hideLoader()
            self.showErrorAlert(message: msg)
        })
    }
    
    // MARK: - Setups
    private func setup() {
        self.viewModel.delegate = self
        setupBack()
        setupTaps()
        setupTableView()
        setupCollectionView()
        setupNavigation()
    }
    
    func setupNavigation() {
        titleLabel = UILabel(frame: .zero)
        
        let spacing: CGFloat = 16
        let widthBtns: CGFloat = 60
//        titleLabel = UILabel(frame: CGRect(x: widthBtns, y: 0, width: UIScreen.main.bounds.size.width - widthBtns - spacing, height: 50))
        titleLabel.textAlignment = .center
        titleLabel.text = "Carregando..."
        titleLabel.isUserInteractionEnabled = true
        titleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapTitleView)))
        self.navigationItem.titleView = titleLabel
        
        let partnerImgView = UIImageView(image: UIImage(named: "ic_handshake"))
        partnerImgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapPartner)))
        partnerImgView.isUserInteractionEnabled = true
        let partnerBtn = UIBarButtonItem(customView: partnerImgView)
        
        let aboutImgView = UIImageView(image: UIImage(named: "ic_question"))
        aboutImgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapAbout)))
        aboutImgView.isUserInteractionEnabled = true
        let aboutBtn = UIBarButtonItem(customView: aboutImgView)
        
        self.navigationItem.rightBarButtonItems = [aboutBtn, partnerBtn]
        
    }
    
    func setupTaps(){
        self.mapButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapMapButton)))
    }
    
    func setupTableView(){
        self.tableView.registerNib(named: ESTABLISHMENT_CELL_IDENTIFIER)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupCollectionView(){
        self.collectionView.registerNib(named: CATEGORY_CELL_IDENTIFIER)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    // MARK: - Actions
    @objc func didTapMapButton() {
        self.navigationController?.pushViewController(MapViewController(establishments: self.viewModel.establishments), animated: true)
    }
    
    @objc func didTapTitleView() {
        let vc = SelectViewController(items: self.viewModel.getCategorySelectModels())
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapPartner() {
        self.navigationController?.pushViewController(PartnerViewController(), animated: true)
    }
    
    @objc func didTapAbout() {
        self.navigationController?.pushViewController(AboutAmakiViewController(), animated: true)
    }
    
    
}

// MARK: - TableView
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.establishments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ESTABLISHMENT_CELL_IDENTIFIER) as! EstablishmentTableViewCell
        cell.selectionStyle = .none
        cell.setup(establishment: self.viewModel.establishments[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = EstablishmentViewController(establishment: self.viewModel.establishments[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - CollectionView
extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let lbl = UILabel(frame: .zero)
        lbl.text = self.viewModel.categories[indexPath.item].name
        lbl.sizeToFit()
        
        return CGSize(width: lbl.frame.size.width + 24, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CATEGORY_CELL_IDENTIFIER, for: indexPath) as! CategoryCollectionViewCell
        cell.setup(category: self.viewModel.categories[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel.selectCategory(at: indexPath.item)
        self.collectionView.reloadData()
        self.fetchEstablishments()
    }
}

// MARK: - HomeViewModelDelegate
extension HomeViewController: HomeViewModelDelegate {
    func updateTitle(text: String) {
        self.titleLabel.text = text
        self.titleLabel.sizeToFit()
    }
}

// MARK: - SelectViewControllerDelegate
extension HomeViewController: SelectViewControllerDelegate {
    func didSelect(items: [SelectModel]) {
        self.viewModel.selectCity(items.first(where: {$0.isSelected == true}))
    }
    
    func reloadData() {
        self.fetchEstablishments()
    }
}

