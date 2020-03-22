//
//  COVLoginController.swift
//  iOS
//
//  Created by Bryan Gonzales Vega on 3/22/20.
//  Copyright © 2020 COVID19-UTEC. All rights reserved.
//

import UIKit

class COVLoginController: UIViewController {

    @IBOutlet weak var documentTypeTextfield: COVTextField!
    @IBOutlet weak var documentNumberTextfield: COVTextField!
    @IBOutlet weak var loginButton: COVButton!
    
    private var picker : UIPickerView?
    private var pickerData : [String] = ["DNI", "Passport", "PTP"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureInputFields()
        
        let tapBackground = UITapGestureRecognizer(target: self, action: #selector(onTapBackground))
        self.view.addGestureRecognizer(tapBackground)
    }
    
    fileprivate func configureInputFields(){
        
        documentTypeTextfield.rightImage = .downArrow
        documentTypeTextfield.rightImageColor = .black
        
        
        picker = UIPickerView()
        picker?.delegate    = self
        picker?.dataSource  = self
        documentTypeTextfield.inputView     = picker
    }
    
    @objc func onTapBackground() {
        self.view.endEditing(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func login(_ sender: Any) {
        loginButton.startLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.loginButton.stopLoading()
        }
    }
}

extension COVLoginController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        documentTypeTextfield.text = pickerData[row]
    }
}

extension COVLoginController : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}
