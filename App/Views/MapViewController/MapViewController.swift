//
//  MapViewController.swift
//  Project
//
//  Created by Victor Catão on 28/04/19.
//  Copyright (c) 2019 Catao. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    convenience required init(establishments: [EstablishmentResponse]) {
        self.init()
        self.viewModel.establishments = establishments
    }
    
    
    // MARK: - Outlets
    @IBOutlet weak var mapView: UIView!
    
    // MARK: - Variables
    private let viewModel = MapViewModel()
    private let imgView = UIImageView(image: UIImage(named: "ic_pin_amaki"))
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupMap()
    }
    
    // MARK: - Setups
    private func setup() {
        title = "Mapa"
    }
    
    private func setupMap() {
        let lat = self.viewModel.establishments.first?.latitude?.doubleValue ?? 0
        let lng = self.viewModel.establishments.first?.longitude?.doubleValue ?? 0
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lng, zoom: 12.0)
        let map = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.mapView.addSubview(map)
        
        for place in self.viewModel.establishments {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: place.latitude?.doubleValue ?? 0, longitude: place.longitude?.doubleValue ?? 0)
            marker.map = map
            marker.iconView = imgView
            
            marker.title = place.name
        }
        self.view.layoutIfNeeded()
    }
    
}
