//
//  MTHomeBannerCVCell.swift
//  MachineTest
//
//  Created by WC-64 on 07/09/22.
//  Copyright © 2022 organistation. All rights reserved.
//

import UIKit

class MTHomeBannerCVCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureCell(viewModel : BannerViewModel){
        self.imageView.setImage(imagePath: viewModel.image)
    }

}
