//
//  UIView+Layer.swift
//  iOS
//
//  Created by Bryan Gonzales Vega on 3/22/20.
//  Copyright © 2020 COVID19-UTEC. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func circleShape() {
        setCorner(withRadius: frame.size.height/2)
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

    func setCorner(withRadius radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    
    func setBorder(width: CGFloat, andColor color: UIColor){
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
