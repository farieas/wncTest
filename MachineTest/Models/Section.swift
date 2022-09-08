//
//  Section.swift
//  MachineTest
//
//  Created by WC-64 on 08/09/22.
//  Copyright © 2022 organistation. All rights reserved.
//

import UIKit

typealias SectionProvider = (_ section:Int,_ environment:NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection

enum Section : String {
    
    case category = "category"
    case banner = "banners"
    case product = "products"
    
    func sectionLayout() -> NSCollectionLayoutSection  {
        switch self {
        case .category:
            return categoryLayout()
        case .banner:
            return bannerLayout()
        case .product:
            return productLayout()
        }
    }
    
}

extension Section {
    
    fileprivate func categoryLayout() -> NSCollectionLayoutSection {
        let itemSize:NSCollectionLayoutSize = .init(widthDimension:.fractionalWidth(1),
                                                    heightDimension: .estimated(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize:NSCollectionLayoutSize = .init(widthDimension: .fractionalWidth(0.2),
                                                     heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize:groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        return section
    }
    
    fileprivate func bannerLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 20, bottom: 20, trailing: 20)
        return section
    }
    
    fileprivate func productLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(158/375), heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 20, bottom: 20, trailing: 20)
        return section
    }
    
}
