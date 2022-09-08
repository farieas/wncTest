//
//  MTHomeViewController.swift
//  MachineTest
//
//  Created by WC-64 on 07/09/22.
//  Copyright © 2022 organistation. All rights reserved.
//

import UIKit


class MTHomeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView : UICollectionView!
    
    
    
    // MARK: - Properties
    
    let viewModel = HomeViewModel()
    
    lazy var sectionProvider : SectionProvider = { section,env in
        self.viewModel.getSectionLayout(section: section).sectionLayout()
    }
    
    
    // MARK: - ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.registerCell()
        self.setUpCollectionView()
        self.viewModel.updateData = {
            self.collectionView.reloadData()
        }
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: - Cell Registration
    
    func registerCell() {
        self.collectionView.register(cellClass: MTCategoryCVCell.self)
        self.collectionView.register(cellClass: MTHomeBannerCVCell.self)
        self.collectionView.register(cellClass: MTProductCVCell.self)
    }
    
    // MARK: - Configure CollectionView
    
    func setUpCollectionView() {
        self.collectionView.contentInset.top = 10
        self.collectionView.setCollectionViewLayout(createLayout(), animated: true)
        self.collectionView.dataSource = self
    }
    
    // MARK: - Create Collection View Layout
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: config)
    }
    
}

    // MARK: - UICollectionViewDataSource

extension MTHomeViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = viewModel.getSectionLayout(section: indexPath.section)
        let item = viewModel.itemFor(indexPath: indexPath)
        switch section {
        case .category:
            let cell = collectionView.dequeueReusableCell(MTCategoryCVCell.self, for: indexPath)
            cell.configureCell(viewModel: CatergoryViewModel(model: item))
            return cell
        case .banner:
            let cell = collectionView.dequeueReusableCell(MTHomeBannerCVCell.self, for: indexPath)
            cell.configureCell(viewModel: BannerViewModel(model: item))
            return cell
        case .product:
            let cell = collectionView.dequeueReusableCell(MTProductCVCell.self, for: indexPath)
            cell.configureCell(viewModel: ProductsViewModel(model: item))
            return cell
        }
    }
}
