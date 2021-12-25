//
//  ViewController.swift
//  UIPickerViewExample
//
//  Created by 장효원 on 2021/12/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var pickerView: UIPickerView!
    
    var data:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        createExampleDatas()
    }
    
    func createExampleDatas() {
        var i = 1
        while i < 21 {
            data.append("test\(i)")
            i += 1
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row : \(row)")
        print("value : \(data[row])'")
    }
}
