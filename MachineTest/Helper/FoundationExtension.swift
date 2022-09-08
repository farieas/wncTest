//
//  FoundationExtension.swift
//  MachineTest
//
//  Created by WC-64 on 08/09/22.
//  Copyright © 2022 organistation. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func updateStrike() -> NSAttributedString {
         let strokeEffect: [NSAttributedString.Key : Any] = [
             NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
             NSAttributedString.Key.strikethroughColor: Palette.strikePriceColor,
         ]
         let strokeString = NSAttributedString(string:self, attributes: strokeEffect)
         return strokeString
     }

    
}
