//
//  App.swift
//  MachineTest
//
//  Created by WC-64 on 08/09/22.
//  Copyright © 2022 organistation. All rights reserved.
//

import Foundation
import UIKit

protocol Color {
    
    static var offerRed : UIColor { get }
    static var accentColor : UIColor { get }
    static var strikePriceColor : UIColor { get }
}

struct Palette : Color {
    
    static var accentColor: UIColor { return UIColor(named: "AccentColor")! }
    static var offerRed: UIColor { return UIColor(named: "OfferRed")! }
    static var strikePriceColor: UIColor { return UIColor(named: "StrikePriceColor")! }
    
}
