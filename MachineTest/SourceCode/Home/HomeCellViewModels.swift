//
//  CatergoryViewModel.swift
//  MachineTest
//
//  Created by WC-64 on 08/09/22.
//  Copyright © 2022 organistation. All rights reserved.
//

import Foundation


struct CatergoryViewModel {
    
    let image : String
    let name : String
    
    init(model:Values?) {
        self.image = model?.image_url ?? ""
        self.name = model?.name ?? ""
    }
}

struct BannerViewModel {
    let image : String
    
    init(model:Values?) {
        self.image = model?.banner_url ?? ""
    }
}

struct ProductsViewModel {
    let image : String
    let name : String
    let is_express : Bool
    let orginal_price : String?
    let selling_price : String?
    let offer : String
    
    var isOfferBadgeHidden : Bool {
        offer == "0 % off"
    }
    
    init(model:Values?) {
        self.image = model?.image ?? ""
        self.name = model?.name ?? ""
        self.is_express = model?.is_express ?? true
        self.offer = "\(model?.offer ?? 0) % off"
        self.orginal_price = (model?.offer ?? 0) == 0 ? "" : model?.actual_price
        self.selling_price =  (model?.offer ?? 0) == 0 ? model?.actual_price : model?.offer_price
    }
    
}
