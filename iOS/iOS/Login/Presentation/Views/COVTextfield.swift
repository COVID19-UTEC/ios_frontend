//
//  COVTextfield.swift
//  iOS
//
//  Created by Bryan Gonzales Vega on 3/22/20.
//  Copyright © 2020 COVID19-UTEC. All rights reserved.
//

import UIKit


class COVTextFieldStyle {
    static let textFieldHeight  : CGFloat = 36.6
    static let errorLabelHeight : CGFloat = 23.0
    static let cornerRadius     : CGFloat = 4.0
    static let padding          : CGFloat = 12.0
    static let accesoryWidth    : CGFloat = 42.0
}

open class COVTextField : UITextField {
    var leftImageColor : UIColor? = nil {
        didSet {
            leftView?.tintColor = leftImageColor
        }
    }

    var rightImageColor : UIColor? = nil {
        didSet {
            rightView?.tintColor = rightImageColor
        }
    }

    var leftImage : UIImage? = nil {
        didSet {
            leftViewMode        = UITextField.ViewMode.always
            leftView?.tintColor = leftImageColor
            leftView            = accesoryView(from: leftImage)
        }
    }

    var rightImage : UIImage? = nil {
        didSet {
            rightViewMode        = UITextField.ViewMode.always
            rightView?.tintColor = rightImageColor
            rightView            = accesoryView(from: rightImage)
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        let leftPadding : CGFloat = (self.leftView != nil) ? COVTextFieldStyle.accesoryWidth : COVTextFieldStyle.padding
        let rightPadding : CGFloat = (self.rightView != nil) ? COVTextFieldStyle.accesoryWidth : COVTextFieldStyle.padding
        
        let totalPadding : CGFloat = (self.rightView != nil) ? leftPadding + rightPadding : leftPadding

        let rect = CGRect(x: leftPadding, y: 0, width: bounds.size.width - (totalPadding), height: bounds.size.height)
        return rect
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    override open func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = textRect(forBounds: bounds)
        rect.size.width = COVTextFieldStyle.accesoryWidth
        rect.origin.x = bounds.size.width - rect.size.width
        return rect
    }
    
    override open func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = textRect(forBounds: bounds)
        rect.size.width = COVTextFieldStyle.accesoryWidth
        rect.origin.x = 0
        return rect
    }
}

fileprivate extension COVTextField {
    func accesoryView(from image : UIImage?) -> UIView? {
        if let unwrappedImage = image {
            let imageView       = UIImageView(image: unwrappedImage)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            let accesoryView = UIView()
            accesoryView.addSubview(imageView)
            
            imageView.contentMode = .scaleAspectFit
            imageView.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
            imageView.centerXAnchor.constraint(equalTo: accesoryView.centerXAnchor).isActive = true
            imageView.centerYAnchor.constraint(equalTo: accesoryView.centerYAnchor).isActive = true
            
            return accesoryView
        }
        return nil
    }
}
