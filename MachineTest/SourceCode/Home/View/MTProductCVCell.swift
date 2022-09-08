//
//  MTProductCVCell.swift
//  MachineTest
//
//  Created by WC-64 on 07/09/22.
//  Copyright © 2022 organistation. All rights reserved.
//

import UIKit


class MTProductCVCell: UICollectionViewCell {

    @IBOutlet weak var viewOffer : UIView!
    @IBOutlet weak var ivExpress : UIImageView!
    @IBOutlet weak var image : UIImageView!
    @IBOutlet weak var lblOfferPercentage : UILabel!
    @IBOutlet weak var lblOrginalPrice : UILabel!
    @IBOutlet weak var lblSellingPrice : UILabel!
    @IBOutlet weak var lblName : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(viewModel : ProductsViewModel?){
        self.image.setImage(imagePath: viewModel?.image)
        self.viewOffer.isHidden = viewModel?.isOfferBadgeHidden ?? true
        self.ivExpress.isHidden = !(viewModel?.is_express ?? false)
        self.lblOfferPercentage.text = viewModel?.offer
        self.lblName.text = viewModel?.name
        self.lblOrginalPrice.attributedText = viewModel?.orginal_price?.updateStrike()
        self.lblSellingPrice.text = viewModel?.selling_price
        
    }

}
