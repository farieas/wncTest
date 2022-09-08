//
//  HomeViewModel.swift
//  MachineTest
//
//  Created by WC-64 on 08/09/22.
//  Copyright © 2022 organistation. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    let apiService = Network.shared
    private var home : Home?
    
    var updateData : (() -> Void) = { }
    var numberOfSection : Int { self.home?.homeData?.count ?? 0 }
  
    
    init() {
        self.fetchHomeData()
    }
    
    fileprivate func fetchHomeData() {
        Task.init {
            self.home = await apiService.fetchData()
            DispatchQueue.main.async {
                self.updateData()
            }
        }
    }
    
    func getSectionLayout(section:Int) -> Section {
         Section(rawValue: self.home?.homeData?[section].type ?? "") ?? .category
    }
    
    func numberOfItemInSection(section:Int) -> Int {
        home?.homeData?[section].values?.count ?? 0
    }
    
    func itemFor(indexPath:IndexPath) -> Values? {
         home?.homeData?[indexPath.section].values?[indexPath.item] 
    }
    
}

