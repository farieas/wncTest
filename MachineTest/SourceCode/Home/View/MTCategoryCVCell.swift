//
//  MTCategoryCVCell.swift
//  MachineTest
//
//  Created by WC-64 on 07/09/22.
//  Copyright © 2022 organistation. All rights reserved.
//

import UIKit

class MTCategoryCVCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var lblName : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(viewModel : CatergoryViewModel) {
        self.lblName.text = viewModel.name
        self.imageView.setImage(imagePath: viewModel.image)
    }
    

}
