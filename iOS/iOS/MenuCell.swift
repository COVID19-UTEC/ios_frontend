//
//  MenuCell.swift
//  iOS
//
//  Created by Andrea Diaz ♡ on 3/23/20.
//  Copyright © 2020 COVID19-UTEC. All rights reserved.
//

import UIKit
import PureLayout

class MenuCell: BaseCell {
    override func addSubviews() {
        backgroundColor = UIColorFromRGB(rgbValue: 0x0000)
        
        addSubview(homeOffImage)
        addSubview(idTextField)
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            homeOffImage.autoAlignAxis(toSuperviewAxis: .horizontal)
            homeOffImage.autoPinEdge(toSuperviewEdge: .top, withInset: 1.0)
            
            idTextField.autoAlignAxis(toSuperviewAxis: .vertical)
            idTextField.autoPinEdge(toSuperviewEdge: .top)
            
            shouldSetupConstraints = false
        }
        
        super.updateConstraints()
    }
    
    lazy var homeOffImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "homeOff")
        imageView.autoSetDimensions(to: CGSize(width: 23.46, height: 26.07))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
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
