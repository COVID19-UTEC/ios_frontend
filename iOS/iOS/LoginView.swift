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
    // rgb colors with alpha
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
           return UIColor(
               red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
               green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
               blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
               alpha: CGFloat(1.0)
           )
       }
    
    var shouldSetupConstraints = true
    
    lazy var peruLogo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.autoSetDimensions(to: CGSize(width: 108.2, height: 108.49))
        
        return imageView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.autoSetDimension(.height, toSize: 232)
        view.backgroundColor = .gray // color its just for guides
        
        return view
    }()
    
    lazy var idTextField: UITextField! = {
        let textField = UITextField
        textField.backgroundColor = UIColorFromRGB(rgbValue: #FFFFFF)
        return textField
    }
    
    func addSubviews() {
        self.addSubview(peruLogo)
        self.addSubview(containerView)
        self.bringSubviewToFront(peruLogo)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            containerView.autoAlignAxis(toSuperviewAxis: .horizontal)
            containerView.autoAlignAxis(toSuperviewAxis: .vertical)
            containerView.autoPinEdge(toSuperviewEdge: .left, withInset: 72.0)
            containerView.autoPinEdge(toSuperviewEdge: .right, withInset: 72.0)
            containerView.autoPinEdge(toSuperviewEdge: .top, withInset: 185.0)
            
            peruLogo.autoAlignAxis(toSuperviewAxis: .vertical)
            peruLogo.autoPinEdge(.top, to: .top, of: containerView, withOffset: 20.0)
            
          
            shouldSetupConstraints = false
        }
        
        super.updateConstraints()
    }
}
