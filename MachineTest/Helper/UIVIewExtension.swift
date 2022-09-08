//
//  UIVIewExtension.swift
//  MachineTest
//
//  Created by WC-64 on 08/09/22.
//  Copyright © 2022 organistation. All rights reserved.
//

import Foundation
import UIKit

protocol ViewProperties {
    
    var cornerRadius : CGFloat { get set }
    var borderColor : UIColor { get set }
    var borderWidth : CGFloat { get set }
    var roundedCorner : Bool { get set }
    
}


extension UIView  : ViewProperties {
   
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        } set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.borderColor ?? UIColor.white.cgColor)
        } set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        } set {
            self.layer.borderWidth = newValue
        }
    }
    
    
    @IBInspectable
    var roundedCorner: Bool {
        get {
            return self.layer.cornerRadius == self.bounds.width/2
        } set {
            DispatchQueue.main.async {
                self.layer.cornerRadius = newValue ? self.bounds.width/2 : self.cornerRadius
                self.layoutIfNeeded()
            }
        }
    }
    

}
