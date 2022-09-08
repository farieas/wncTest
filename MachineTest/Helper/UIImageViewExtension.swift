//
//  UIImageViewExtension.swift
//  MachineTest
//
//  Created by WC-64 on 08/09/22.
//  Copyright © 2022 organistation. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(imagePath:String?) {
        if let url = URL(string: imagePath ?? "") {
            self.kf.setImage(with: url, placeholder: UIImage(systemName: "photo.artframe")?.withTintColor(UIColor.gray))
        }
    }
    
}
