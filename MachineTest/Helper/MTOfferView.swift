//
//  MTOfferView.swift
//  MachineTest
//
//  Created by WC-64 on 08/09/22.
//  Copyright © 2022 organistation. All rights reserved.
//

import UIKit

class MTOfferView: UIView {

    let path = UIBezierPath()
    let shapeLayer = CAShapeLayer()
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: self.bounds.maxX, y: self.bounds.minY))
        path.addLine(to: CGPoint(x: self.bounds.maxX-10, y: self.bounds.midY))
        path.addLine(to: CGPoint(x: self.bounds.maxX, y: self.bounds.maxY))
        path.addLine(to: CGPoint(x: self.bounds.minX, y: self.bounds.maxY))
        path.close()
        
       
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.masksToBounds = false
        self.layer.addSublayer(shapeLayer)
        
        
    }
    

}
