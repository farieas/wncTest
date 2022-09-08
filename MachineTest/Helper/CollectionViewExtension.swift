//
//  CollectionViewExtension.swift
//  MachineTest
//
//  Created by WC-64 on 07/09/22.
//  Copyright © 2022 organistation. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension UICollectionViewCell : ReusableView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(cellClass : T.Type) {
        self.register(UINib(nibName: T.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    

    func dequeueReusableCell<T: UICollectionViewCell>(_ identifier:T.Type,for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: identifier.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell")
        }
        return cell
    }
    
}
