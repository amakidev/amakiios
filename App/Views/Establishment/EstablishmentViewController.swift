//
//  EstablishmentViewController.swift
//  Project
//
//  Created by Victor Catão on 22/04/19.
//  Copyright (c) 2019 Catao. All rights reserved.
//

import UIKit
import GoogleMaps

class EstablishmentViewController: UIViewController {
    
    // MARK: - Init
    convenience required init(establishment: EstablishmentResponse) {
        self.init()
        self.viewModel.establishment = establishment
    }
    
    // MARK: - Outlets
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var facebookLabel: UILabel!
    @IBOutlet weak var instagramLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var whatsappLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var facebookStackView: UIStackView!
    @IBOutlet weak var instagramStackView: UIStackView!
    @IBOutlet weak var websiteStackView: UIStackView!
    @IBOutlet weak var whatsappStackView: UIStackView!
    @IBOutlet weak var phoneStackView: UIStackView!
    @IBOutlet weak var discountImageView: UIImageView!
    
    // MARK: - Variables
    private let viewModel = EstablishmentViewModel()
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: - Setups
    private func setup() {
        title = self.viewModel.getName()
        setupMap()
        setupInfos()
        setupTaps()
    }
    
    func setupMap() {
        
        let (lat, lng) = self.viewModel.getLatLng()
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lng, zoom: 17.0)
        let map = GMSMapView.map(withFrame: self.mapView.frame, camera: camera)
        self.mapView.addSubview(map)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        marker.map = map
        
        let imgView = UIImageView(image: UIImage(named: "ic_pin_amaki"))
        marker.iconView = imgView
    }
    
    func setupInfos(){
        
        // infos
        nameLabel.text = self.viewModel.getName()
        addressLabel.text = self.viewModel.getAddress()
        distanceLabel.text = self.viewModel.getDistance()
        descLabel.text = self.viewModel.getDescription()
        
        facebookLabel.text = self.viewModel.getfacebook()
        instagramLabel.text = self.viewModel.getinstagram()
        websiteLabel.text = self.viewModel.getwebsite()
        whatsappLabel.text = self.viewModel.getwhatsapp()
        phoneLabel.text = self.viewModel.getphone()
        
        // hidden or show
        discountImageView.isHidden = !(self.viewModel.hasDiscount())
        distanceLabel.isHidden = self.viewModel.distanceIsHidden()
        kmLabel.isHidden = self.viewModel.distanceIsHidden()
        facebookStackView.isHidden = self.viewModel.facebookIsHidden()
        instagramStackView.isHidden = self.viewModel.instagramIsHidden()
        websiteStackView.isHidden = self.viewModel.websiteIsHidden()
        whatsappStackView.isHidden = self.viewModel.whatsappIsHidden()
        phoneStackView.isHidden = self.viewModel.phoneIsHidden()
        
        
    }
    
    func setupTaps(){
        self.facebookStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapfacebook)))
        self.instagramStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapinstagram)))
        self.websiteStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapwebsite)))
        self.whatsappStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapwhatsapp)))
        self.phoneStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapphone)))
        
    }
    
    @objc func didTapfacebook() {
        guard let url = URL(string: "https://facebook.com/\(self.viewModel.getfacebook() ?? "")") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @objc func didTapinstagram() {
        guard let url = URL(string: "https://instagram.com/\(self.viewModel.getinstagram() ?? "")") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @objc func didTapwebsite() {
        guard let url = URL(string: "\(self.viewModel.getwebsite() ?? "")") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @objc func didTapwhatsapp() {
        
        if self.viewModel.isWhatsApp() {
            if let whatappURL = URL(string: "https://api.whatsapp.com/send?phone=\(self.viewModel.getwhatsapp()?.cleanPhoneCharacteres() ?? "")&text=Ola"),
                UIApplication.shared.canOpenURL(whatappURL) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(whatappURL, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(whatappURL)
                }
            }
        } else {
            guard let url = URL(string: "tel:\(self.viewModel.getwhatsapp()?.cleanPhoneCharacteres() ?? "")") else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
        
    }
    
    @objc func didTapphone() {
        guard let url = URL(string: "tel:\(self.viewModel.getphone()?.cleanPhoneCharacteres() ?? "")") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    
    
    
    
}
