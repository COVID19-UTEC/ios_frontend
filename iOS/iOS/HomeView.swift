//
//  HomeView.swift
//  iOS
//
//  Created by Andrea Diaz ♡ on 3/23/20.
//  Copyright © 2020 COVID19-UTEC. All rights reserved.
//

import UIKit
import PureLayout

class HomeView: BaseView {
    override func addSubviews() {
        backgroundColor = UIColorFromRGB(rgbValue: 0xF2F2F2)
        self.addSubview(menuBar)
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            menuBar.autoAlignAxis(toSuperviewAxis: .vertical)
            menuBar.autoPinEdge(toSuperviewEdge: .bottom)
            menuBar.autoPinEdge(toSuperviewEdge: .left)

            shouldSetupConstraints = false
        }
        
        super.updateConstraints()
    }
    
    lazy var menuBar: MenuBar = {
        let menuBarView = MenuBar()
        menuBarView.autoSetDimensions(to: CGSize(width: 375, height: 97.0))
        menuBarView.layer.cornerRadius = 25
        menuBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return menuBarView
    }()
}
