//
//  AboutAmakiViewModel.swift
//  Project
//
//  Created by Victor Catão on 28/04/19.
//  Copyright (c) 2019 Catao. All rights reserved.
//

import UIKit

class AboutAmakiViewModel {
    
    private var about: AboutAmakiResponse?
    
    func fetchAbout(success: @escaping ()->(), error: @escaping (String)->()) {
        EstablishmentManager.getAboutAmaki(success: { (response) in
            self.about = response
            success()
        }) { (msg, _) in
            error(msg)
        }
    }
    
    func getText() -> String? {
        return self.about?.text
    }
    
}
