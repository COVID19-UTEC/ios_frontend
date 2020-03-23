//
//  MenuBar.swift
//  iOS
//
//  Created by Andrea Diaz ♡ on 3/22/20.
//  Copyright © 2020 COVID19-UTEC. All rights reserved.
//

import UIKit
import PureLayout

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

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
        backgroundColor = UIColorFromRGB(rgbValue: 0xFFFF)
        addSubview(menuCollectionView)
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            menuCollectionView.autoAlignAxis(toSuperviewAxis: .vertical)
            menuCollectionView.autoPinEdge(toSuperviewEdge: .left, withInset: 72.0)
            menuCollectionView.autoPinEdge(toSuperviewEdge: .right, withInset: 72.0)

            shouldSetupConstraints = false
        }
        
        super.updateConstraints()
    }
    
    lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        return collectionView
    }()
    
    let cellId = "cellId"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
              print("Hello collectionView")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = UIColor.blue
  
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 2, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    

}
