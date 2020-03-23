//
//  BaseView.swift
//  iOS
//
//  Created by Andrea Diaz ♡ on 3/23/20.
//  Copyright © 2020 COVID19-UTEC. All rights reserved.
//

import UIKit
import PureLayout

class BaseView: UIView {
    var shouldSetupConstraints = true
    
    // rgb colors with alpha
    func UIColorFromRGB(rgbValue: UInt, alphaValue: Float = 1.0) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alphaValue)
        )
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
           
            shouldSetupConstraints = false
        }
        
        super.updateConstraints()
    }
    
    
}
