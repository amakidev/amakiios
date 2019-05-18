//
//  HomeViewModel.swift
//  Project
//
//  Created by Victor Catão on 21/04/19.
//  Copyright (c) 2019 Catao. All rights reserved.
//

import UIKit

protocol HomeViewModelDelegate: class {
    func updateTitle(text: String)
    func reloadData()
}

class HomeViewModel {
    
    weak var delegate: HomeViewModelDelegate?
    
    private(set) var categories = [CategoryResponse]()
    private(set) var selectedCategory: CategoryResponse?
    
    private(set) var cities = [CityStateResponse]()
    private(set) var selectedCity: CityStateResponse?
    
    private(set) var establishments = [EstablishmentResponse]()
    
    private(set) var userLat: Double?
    private(set) var userLong: Double?
    
    func fetchCities(success: @escaping ()->(), error: @escaping (String)->()) {
        EstablishmentManager.getStatesAndCities(success: { (response) in
            self.cities = response
            self.selectedCity = self.cities.first
            self.delegate?.updateTitle(text: self.getNameForCity(self.selectedCity))
            success()
        }) { (msg, _) in
            error(msg)
        }
    }
    
    private func getNameForCity(_ city: CityStateResponse?) -> String {
        guard let ct = city else { return "..." }
        guard let name = ct.name else { return "..." }
        guard let state = ct.state_id?.nameShort else { return "..." }
        return "\(name)-\(state) ▼"
    }
    
    func fetchCategories(success: @escaping ()->(), error: @escaping (String)->()) {
        CategoryManager.getCategories(success: { (response) in
            self.categories = response
            let allCategories = CategoryResponse()
            allCategories.name = "Todos"
            allCategories.isSelected = true
            self.categories.insert(allCategories, at: 0)
            success()
        }) { (msg, _) in
            error(msg)
        }
    }
    
    func fetchEstablishments(success: @escaping ()->(), error: @escaping (String)->()) {
        let req = GetEstablishmentsRequest()
        req.category_id = selectedCategory?._id
        req.city_id = selectedCity?._id
        req.user_lat = (userLat == nil) ? nil : NSNumber(value: userLat!)
        req.user_long = (userLong == nil) ? nil : NSNumber(value: userLong!)
        
        EstablishmentManager.getEstablishments(request: req, success: { (response) in
            self.establishments = response
            success()
        }) { (msg, _) in
            error(msg)
        }
    }
    
    func setUserLatLng(_ lat: Double, long: Double) {
        self.userLat = lat
        self.userLong = long
    }
    
    func selectCity(_ city: SelectModel?) {
        guard let ct = city else { return }
        self.selectedCity = self.cities.first(where: {$0._id == ct.id})
        self.delegate?.updateTitle(text: self.getNameForCity(self.selectedCity))
        self.delegate?.reloadData()
    }
    
    func selectCategory(at index: Int) {
        self.categories.forEach({$0.isSelected = false})
        self.categories[index].isSelected = true
        self.selectedCategory = self.categories[index]
    }
    
    func getCategorySelectModels() -> [SelectModel] {
        return self.cities.map{ SelectModel(id: $0._id, isSelected: false, name: self.getNameForCity($0))}
    }
    
}
