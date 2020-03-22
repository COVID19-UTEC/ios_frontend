//
//  LoginView.swift
//  iOS
//
//  Created by Andrea Diaz ♡ on 3/22/20.
//  Copyright © 2020 COVID19-UTEC. All rights reserved.
//

import UIKit
import PureLayout

class LoginView: UIView {
    var shouldSetupConstraints = true
    
    let PeruLogo: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        PeruLogo.autoSetDimension(.width, toSize: 108.2)
        PeruLogo.autoSetDimension(.height, toSize: 108.49)
        
        self.addSubview(PeruLogo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
          
          let edgesInset: CGFloat = 10.0
          
            PeruLogo.autoPinEdge(toSuperviewEdge: .top, withInset: edgesInset)
          
          shouldSetupConstraints = false
        }
        
        super.updateConstraints()
    }
}
