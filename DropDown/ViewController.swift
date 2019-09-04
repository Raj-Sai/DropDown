//
//  ViewController.swift
//  DropDown
//
//  Created by Amsaraj Mariappan on 4/9/2562 BE.
//  Copyright © 2562 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
    var selectedCountry: String?
    var countryList = ["Algeria", "Andorra", "Angola", "India", "Thailand"]
    @IBOutlet weak var textFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        dismissPickerView()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryList[row]
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountry = countryList[row]
        textFiled.text = selectedCountry
    }
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        textFiled.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        textFiled.inputAccessoryView = toolBar
    }
    
    @objc func action() {
       view.endEditing(true)
    }


}

