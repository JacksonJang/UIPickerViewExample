//
//  CustomPickerView.swift
//  UIPickerViewExample
//
//  Created by 장효원 on 2021/12/26.
//

import Foundation
import UIKit

class CustomPickerView: UIViewController {
    @IBOutlet var pickerView: UIPickerView!
    
    var data:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerDelegate()
        createExampleDatas()
    }
    
    func registerDelegate() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func createExampleDatas() {
        var i = 1
        while i < 21 {
            data.append("test\(i)")
            i += 1
        }
    }
}

extension CustomPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
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
