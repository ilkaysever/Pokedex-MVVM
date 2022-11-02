//
//  UIImage+Ext.swift
//  Pokedex
//
//  Created by İlkay Sever on 1.11.2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageUrl(imageUrl: String) {
        if let url = URL(string: ((imageUrl))) {
            self.kf.indicatorType = .activity
            self.kf.setImage(with: url, placeholder: UIImage(named: "pokeball"))
        }
    }

}
