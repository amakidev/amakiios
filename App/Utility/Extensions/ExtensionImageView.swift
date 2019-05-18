//
//  UIImageViewCatao.swift
//  Catao
//
//  Created by Catao on 18/12/2017.
//  Copyright © 2017 Catao. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    /**
        Insere a imagem. Se a URL for null, então coloca a imagem default NAME_PLACEHOLDER_NO_PHOTO
     */
    func setImage(imageURL: String?){
        if let imgURL = imageURL {
            UIView.animate(withDuration: 0.5) {
                self.sd_setImage(with: URL(string: imgURL), completed: nil)
            }
        }
        else {
            self.image = UIImage(named: NAME_PLACEHOLDER_NO_PHOTO)
        }
        
    }
    func setImageWithPlaceholder(imageURL: String?, placeholder: UIImage =  #imageLiteral(resourceName: "placeholder-no-photo"), completed: @escaping () -> ()) {
        if let imgURL = imageURL {
            sd_setImage(with: URL(string: imgURL), placeholderImage: placeholder) { (image, error, cacheType, url) in
                completed()
            }
        }
        else {
            self.image = placeholder
        }
    }
    
    func setImageWithCompleted(imageURL: String?, completed: @escaping () -> ()) {
        if let imgURL = imageURL {
            sd_setImage(with: URL(string: imgURL)) { (image, error, cacheType, url) in
                completed()
            }
        }
        else {
            self.image = UIImage(named: NAME_PLACEHOLDER_NO_PHOTO)
        }
    }
    
}
