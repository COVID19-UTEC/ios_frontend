//
//  COVButton.swift
//  iOS
//
//  Created by Bryan Gonzales Vega on 3/22/20.
//  Copyright © 2020 COVID19-UTEC. All rights reserved.
//

import UIKit

class COVButton: UIButton {
    private lazy var spinner: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .white)
        activity.hidesWhenStopped = true
        return activity
    }()
    
    override public var isEnabled: Bool {
        didSet {
            self.backgroundColor = isEnabled ? UIColor(named: "COVWhite") : UIColor.lightGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        insertSpinner()
        configureButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        insertSpinner()
        configureButton()
    }
    
    private func configureButton (){
        translatesAutoresizingMaskIntoConstraints = false
        setCorner(withRadius: 5)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.semibold)
    }
    
    fileprivate func insertSpinner(){
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        spinner.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
    public func startLoading(){
        spinner.startAnimating()
        isEnabled = false
    }
    
    public func stopLoading(){
        spinner.stopAnimating()
        isEnabled = true
    }
}
