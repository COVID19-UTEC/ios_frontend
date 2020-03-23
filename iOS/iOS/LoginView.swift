//
//  LoginView.swift
//  iOS
//
//  Created by Andrea Diaz ♡ on 3/22/20.
//  Copyright © 2020 COVID19-UTEC. All rights reserved.
//

import UIKit
import PureLayout

class LoginView: BaseView {
    override func addSubviews() {
        backgroundColor = UIColorFromRGB(rgbValue: 0xbd0f17)
        
        self.addSubview(peruLogo)
        self.addSubview(containerView)
        self.addSubview(idTextField)
        
        self.bringSubviewToFront(peruLogo)
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
            
            idTextField.autoAlignAxis(toSuperviewAxis: .vertical)
            idTextField.autoPinEdge(.top, to: .bottom, of: peruLogo, withOffset: 34.0)

            shouldSetupConstraints = false
        }
        
        super.updateConstraints()
    }
    
    lazy var peruLogo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.autoSetDimensions(to: CGSize(width: 108.2, height: 108.49))
        
        return imageView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.autoSetDimension(.height, toSize: 232)
        //view.backgroundColor = .gray // color its just for guides
        
        return view
    }()
    
    lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColorFromRGB(rgbValue: 0xFFFFFF, alphaValue: 0.37)
        textField.autoSetDimensions(to: CGSize(width: 185.0, height: 40.0))
        textField.layer.cornerRadius = 10.0
        textField.keyboardType = UIKeyboardType.numberPad
        textField.font = UIFont(name: "Roboto", size: 15)
        textField.textColor = UIColorFromRGB(rgbValue: 0xFFFFFF)
        
        // inner padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextField.ViewMode.always
        
        return textField
    }()
    
}
